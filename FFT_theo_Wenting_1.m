function [f_st,Esp_st]=FFT_theo_Wenting_1(data,t_p)
%% Modificado por el Ing. José Manuel Ramos Guerrero
%% Signals
% signals = randn(20, 100); % load your signals here.
signals=data;
Fs=56;
Fs=1/t_p;% or 1/(t(2)-t(1));
u = signals; % sort your signals per row.
[mu, nu] = size(u);

for kk = 1:mu
st_m(kk,:)=u(kk,:) -mean(u(kk,:));
st_m1(kk,:)=[st_m(kk,:) zeros(1,(2^14)-nu)];
Esp_st(kk,:)= fftshift(fft(st_m1(kk,:)));
end

f_st = linspace(-Fs/2,Fs/2,length(st_m1(1,:)));

% % % % b1 = plot(f_st,abs(Esp_st)/2^14);
% % % % title('Waveform spectrum')
% % % % xlabel('Frequency (Hz)')
% % % % ylabel('Amplitude')
% % % % xlim([0 2])
% % % % grid on




