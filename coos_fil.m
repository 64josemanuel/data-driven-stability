close all; clear memory; clear all; clc;
% load line_place.mat
load load_place.mat
% load gen_place.mat

[filas,col]=size(B);
% for n_event = 1:length(line_place)
for n_event = 1:filas
% for n_event = 1:length(gen_place)
%     load(['wind_trip_20_G' num2str(gen_place(n_event,2)) '.mat'],'sstr')
   load(['wind_20_trip_Load' num2str(B(n_event,1)) '.mat'],'sstr') 
%     load(['wind_20_trip_Line' num2str(line_place(n_event,2)) '.mat'])
%     load wind_5_trip_Line11.mat
    L=370;
    fs=60;
    t=sstr.t;
    N=length(t);
    senales=abs(sstr.bus_v);
    senal_total=size(senales, 1);
    modes=4;
    am_damping_fin=zeros(modes*senal_total,N - L);
    am_freq_fin=zeros(modes*senal_total,N - L);
    am_amp_fin=zeros(modes*senal_total,N - L);
    freq_fin=zeros(modes*senal_total,1);
    damp_fin=zeros(modes*senal_total,1);
    for n_senal =1:senal_total
        st = senales(n_senal, :);
        st=st+0.002*rand(1,5000);
%         figure(1);
%         plot(t, st, 'r');
%         xlabel('TIME(S)');
%         ylabel('MAGNITUDE');
%         title('SIGNAL');
%         grid on;
        
        fb_zeros = 10;
        bessel_func =0;
        
        scale0 = 1:fb_zeros;
         if N - L < 0
             disp('*** STOP ***');
             disp(['N - L: ' num2str(N - L)]);
         end
        z = linspace(0,2*pi,L);
        fb = zeros(fb_zeros,size(z,2));
%         figure(2)
        for n = 1:fb_zeros
%             % fb(n,:) = sp.jv(bessel_func, z * scale0(n));
            fb(n,:) = cos(z * scale0(n));
%             plot(z, fb(n,:), 'DisplayName', ['f' num2str(n)]);
%             hold on;
        end
        X = fb';
        %%%%%
        ps = inv(X' * X) * X';
%         figure(3);
%         for n = 1:fb_zeros
%             plot(z, ps(n,:), 'DisplayName', ['f' num2str(n)]);
%             hold on;
%         end
%         hold off;
%         xlabel('Time (s)');
%         ylabel('Magnitude');
%         legend('show');
        
        
        t_vec = z;
        y_vec = ps';
        xlim = [0, 3];
        h_vec = [];
        line_style = [];
        colors = [];
        cont=1;
        multisignal_FFT(z, ps.',h_vec, xlim,line_style,colors,cont);
        
        ires = zeros(fb_zeros, N - L);
        jres = zeros(1, N - L);
        mres = zeros(1, N - L);
        serr = zeros(1, N - L);
        tres = linspace(0, (N - L) / fs, N - L);
        rst = st(1:N - L);
        
        
        for n = 1:N-L
            ist = st(n : n + L - 1);
            xcn = ps * ist.';
            ires(:, n) = xcn;
        end
        
        
        
        %iindx = get_modes(tres, ires, scale0, modes);
        [iindx, iires] = get_modes(tres, ires, scale0, modes);
         
        
        modes = size(iires, 1);
        
        
        colors = colormap(winter);
%         fig = figure(4);
%         
%         ax1 = subplot(2, 1, 1);
%         % Código para el primer subgráfico (ax1)
%         
%         ax2 = subplot(2, 1, 2);
%         % Código para el segundo subgráfico (ax2)
%         for i = 1:fb_zeros
%             plot(ax1, tres, ires(i, :), 'DisplayName', ['f' num2str(i)], 'Color', colors(i, :));
%             hold(ax1, 'on');
%         end
%         
%         for i = 1:modes
%             plot(ax2, tres, iires(i, :), 'DisplayName', ['f' num2str(iindx(i) + 1)], 'Color', colors(iindx(i) + 1, :));
%             hold(ax2, 'on');
%         end
%         
%         ylabel(ax1, 'MAGNITUDE');
%         title(ax1, [num2str(fb_zeros) ' MONO-COMPONENTS']);
%         
%         xlabel(ax2, 'TIME (s)');
%         ylabel(ax2, 'MAGNITUDE');
%         title(ax2, [num2str(modes) ' MONO-COMPONENTS']);
%         
%         legend(ax1, 'Location', 'northeast');
%         legend(ax2, 'Location', 'northeast');
%         
%         hold(ax1, 'off');
%         hold(ax2, 'off');
        
        for i = 1:N-L
            jres(i) = sum(ires(:, i));
        end
         jres = jres+.9275;
        
        for i = 1:N-L
            mres(i) = sum(iires(:, i));
        end
         mres = mres+.9575;
        
        yerr0 = sqrt(abs(rst .^ 2 - jres .^ 2));
        serr0 = round(sum(yerr0) / fs, 3);
        
        yerr1 = sqrt(abs(rst .^ 2 - mres .^ 2));
        serr1 = round(sum(yerr1) / fs, 3);
        
        fig = figure(5);
        
        ax1 = subplot(2, 1, 1);
        plot(ax1, tres, rst, 'r', 'DisplayName', 'Signal');
        hold(ax1, 'on');
        plot(ax1, tres, jres, 'k--', 'DisplayName', ['Rec0. ' num2str(fb_zeros) ' modes']);
        plot(ax1, tres, mres, 'b--', 'DisplayName', ['Rec1. ' num2str(modes) ' modes']);
        ylabel(ax1, 'MAGNITUDE');
        title(ax1, 'SIGNAL AND ITS RECONSTRUCTION');
        legend(ax1);
        
        ax2 = subplot(2, 1, 2);
        plot(ax2, tres, yerr0, 'k.-', 'DisplayName', ['Error ' num2str(serr0)]);
        hold(ax2, 'on');
        plot(ax2, tres, yerr1, 'b.-', 'DisplayName', ['Error ' num2str(serr1)]);
        xlabel(ax2, 'TIME (s)');
        ylabel(ax2, 'MAGNITUDE');
        title(ax2, 'ERROR');
        legend(ax2);
        
        hold(ax1, 'off');
        hold(ax2, 'off');
        damping_env=zeros(modes,length(iires));
        freq_env=zeros(modes,length(iires));
        amp_env=zeros(modes,length(iires));
        freq_ov_env=zeros(modes,1);
        damp_ov_env=zeros(modes,1);
        for i = 1:modes
            [freq_av, damp_av,env_amp_dv,env_dam_dv,env_freq_dv] = hilbert_transform(tres, iires(i, :), fs, 'print_chart');
            freq_av = abs(round(freq_av, 2)*10);
            damp_av = round(damp_av, 3)*10;
%             fprintf('freq %.2f damp %.3f\n', freq_av, damp_av);
            damping_env(i,:)=env_dam_dv;
            freq_env(i,:)=env_freq_dv;
            amp_env(i,:)=env_amp_dv;
            freq_ov_env(i)=freq_av;
            damp_ov_env(i)=damp_av;
        end

        y_vec = zeros(length(jres), 3);
        y_vec(:, 1) = rst;
        y_vec(:, 2) = jres;
        y_vec(:, 3) = mres;
        
        h_vec = {'SIGNAL', 'REC0', 'REC1'};
        xlim = [0, 2];
        line_style = {'-', '--', '--'};
        colors = ['r', 'k', 'b'];
        cont=2;
        multisignal_FFT(t_vec, y_vec, h_vec, xlim, line_style, colors, cont);
    am_damping_fin(modes*n_senal-3:modes*n_senal,:)=damping_env;
    am_freq_fin(modes*n_senal-3:modes*n_senal,:)=freq_env;
    am_amp_fin(modes*n_senal-3:modes*n_senal,:)=amp_env;
    freq_fin(modes*n_senal-3:modes*n_senal)=freq_ov_env;
    damp_fin(modes*n_senal-3:modes*n_senal)=damp_ov_env;
    end
%     save(['wind_20_trip_Line_V_cos' num2str(line_place(n_event,2)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
%     save(['wind_20_trip_Load_V_cos' num2str(B(n_event,1)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
%      save(['wind_trip_20_G' num2str(gen_place(n_event,1)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
end

function multisignal_FFT(t_vec, y_vec, h_vec, xlim1, line_style, colors,cont)
if isempty(h_vec)
    h_vec = cell(1, size(y_vec, 2));
    for i = 1:size(y_vec, 2)
        h_vec{i} = ['s' num2str(i)];
    end
end

if isempty(colors)
    icolor = colormap(winter);
    colors = icolor(1:size(y_vec, 2), :);
end

if isempty(line_style)
    line_style = cell(1, size(y_vec, 2));
    for i = 1:size(y_vec, 2)
        line_style{i} = '-';
    end
end

can = size(y_vec, 2);
medf = length(y_vec(:, 1));
dt = t_vec(2) - t_vec(1);
y_z = zeros(2^14, 1);

S0 = zeros(length(y_z) + medf, can);
Es = complex(zeros(length(y_z) + medf, can));

for i = 1:can
    S0(:, i) = [y_vec(:, i); y_z];
    Es(:, i) = fftshift(fft(S0(:, i)));
end

% fx = linspace(-1.0 / (2.0 * dt), 1.0 / (2.0 * dt), length(S0(:, 1)));
% figure(100+cont);
% ax = gca;
% for i = 1:can
%     plot(ax, fx, abs(Es(:, i)), 'LineWidth', 2);
%     hold on;
% end
% 
% xlabel('Frequency (Hz.)');
% ylabel('Magnitude');
% xlim([xlim1(1), xlim1(2)]);
% legend('Location', 'north');
% grid on;
% grid minor;
% hold off;
end


function[iindx, iires]=get_modes(tres, ires, scale0, modes)
energy=[];
    if ((isempty(energy) && isempty(modes)) || (~isempty(energy) && ~isempty(modes)))
        error('ERROR, definir correctamente get_modes...');
        return;
    end
    vec_modes = 1:size(ires, 1);
    vec_enrgy = zeros(1, size(ires, 1));
     for i = 1:size(ires, 1)
        vec_enrgy(i) = sum(ires(i, :) .^ 2);
     end
     vec_enrgy0 = vec_enrgy;
     vec_enrgy1 = sort(vec_enrgy, 'descend');
     sum_e = sum(vec_enrgy1);
     sum_et = 0.0;
     imode = 0;
     pc_sum_et = 0.0;

    %while pc_sum_et <= energy || imode < modes
    while  imode < modes
        imode = imode + 1;
        sum_et = sum_et + vec_enrgy1(imode);
        pc_sum_et = (sum_et / sum_e) * 100.0;
    end

    iires = zeros(imode, length(tres));
    iindx = zeros(1, imode);

    for i = 1:imode
        indx = find(vec_enrgy1(i) == vec_enrgy0, 1);
        iires(i, :) = ires(indx, :);
        iindx(i) = indx;
    end

%     figure(7);
%     ax = gca;
%     plot(ax, vec_modes, vec_enrgy1, 'r-o');
%     ax.XAxisLocation = 'origin';
%     ax.YAxisLocation = 'origin';
%     ax.XLim = [1, vec_modes(end)];
%     ax.YLabel.String = 'MAGNITUDE';
%     ax.XLabel.String = 'MODE';
%     ax.Title.String = 'ENERGY THRESHOLD';
%     grid on;
end

function [freq_av, damp_av,env_amp_dv,env_dam_dv,env_freq_dv] = hilbert_transform(t, st, fs, print_chart)

    himf = hilbert(st);
    amp = abs(himf);
    
    xr = real(himf);
    yr = imag(himf);
    dx = diffxy(t, xr);
    dy = diffxy(t, yr);

    omega_h = (xr .* dy - yr .* dx) ./ (xr .^ 2 + yr .^ 2);    
%     freq_h = (omega_h / (2.0 * pi))*10;
    freq_h = (omega_h / (2.0 * pi));
    freq_h(isnan(freq_h))=0;
    dA = diffxy(t, amp);
    domega = diffxy(t, omega_h);
    damp_h = -(dA) ./ amp - domega / (2.0 * pi);  
    damp_h(isnan(damp_h))=0;
%%
%     t_dv = delimit_vector(t);
    t_dv=t;
%     amp_dv = delimit_vector(amp)*100;
%     amp_dv=amp*100;
    amp_dv=amp;
%     freq_dv = delimit_vector(freq_h);
    freq_dv =freq_h;
%     freq_av = mean(freq_dv)*10;
    freq_av = mean(freq_dv);
%     damp_dv = delimit_vector(damp_h);
    damp_dv=damp_h;
    damp_av = mean(damp_dv);
    env_amp_dv=envelope(amp_dv);
    env_dam_dv=envelope(damp_dv);
    env_freq_dv=envelope(freq_dv);
      if print_chart
        figure(8);
        ax1 = subplot(3, 1, 1);
%         plot(t, st*100, 'r', 'DisplayName', 'SIGNAL');
        plot(t, st, 'r', 'DisplayName', 'SIGNAL');
        hold on;
        plot(t_dv, env_amp_dv, 'k--', 'DisplayName', 'ENVELOPE');
        xlim([5 35])
        ylabel(ax1, 'MAGNITUDE');
        title(ax1, 'ENVELOPE');
        legend(ax1);
        hold off;

      
        ax2 = subplot(3, 1, 2);
        plot(t, freq_h, 'r', 'DisplayName', 'INSTANTANEOUS');
        hold on;
        plot(t_dv, env_freq_dv, 'k--', 'DisplayName', ['AVERAGE ' num2str(round(freq_av, 2)) 'Hz.']);
        xlim([5 35])
        ylabel(ax2, 'MAGNITUDE');
        title(ax2, 'FREQUENCY');
        legend(ax2);
         hold off;
        
        ax3 = subplot(3, 1, 3); 
        plot(t, damp_h, 'r', 'DisplayName', 'INSTANTANEOUS');
        hold on;
        plot(t_dv, env_dam_dv, 'k--', 'DisplayName', ['AVERAGE ' num2str(round(damp_av, 2))]);
        xlim([5 35])
        xlabel(ax3, 'TIME (s)');
        ylabel(ax3, 'MAGNITUDE');
        title(ax3, 'DAMPING');
        legend(ax3);
        hold off;
%         linkaxes([ax1, ax2, ax3], 'x');
      end

freq_av = round(freq_av, 2);
damp_av = round(damp_av, 2);

end

function dy = diffxy(x0, y0)
    x = x0;
    y = y0;

    [h, dy, N, perm] = parse_inputs(x, y);
        
    n = length(h);
    i1 = 1:(n-1);
    i2 = 2:n;

    v = diff(dy) ./ h;

    if n > 1
        dy(i2) = (h(i1) .* v(i2) + h(i2) .* v(i1)) ./ (h(i1) + h(i2));
        dy(1) = 2 * v(1) - dy(2);
        dy(n+1) = 2 * v(n) - dy(n);
    end
end


function [h, dy, N, perm] = parse_inputs(x0, y0)
    x = x0;
    y = y0;

    h = diff(x);
    dy = y;
    N = 1;
    perm = [2, 1];
end

function vec_dv = delimit_vector(vec, limits)
    if nargin < 2
        limits = [0.1, 0.9];
    end

    n = length(vec);
    vec_dv = vec(round(n * limits(1)):round(n * limits(2)));
end