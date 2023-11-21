clc; clear all; close all; clear memory; close all;

 load gen_place.mat
% load load_place.mat
%  load line_place.mat
% [filas,col]=size(B);

time=0:1/60:2499/60;

% for i = 1:7
for i = 1:length(gen_place)

load(['wind_trip_20_G' num2str(gen_place(i,1)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
% load(['wind_5_trip_Load_V_cos' num2str(B(i,1)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
% load(['wind_15_trip_Line_V_cos' num2str(line_place(i,2)) '.mat'],'am_damping_fin','am_freq_fin','am_amp_fin','freq_fin','damp_fin')
     

    
frequ=am_amp_fin(1:4:end,1:2500)'.*rand+am_amp_fin(2:4:end,1:2500)'+am_amp_fin(3:4:end,1:2500)'+am_amp_fin(4:4:end,1:2500)';
w_noise = awgn(1,2500,-15);
frequ_noise=frequ+w_noise';
% frequ=frequ';
frequ=[frequ(:,1) frequ_noise(:,1)]';


% Tiempo de muestro
t_muestro=1/60;
%Limites
freq_lim=[59.99 60.01];
%Frecuencia fundamental
f_o=60;   



n=size(frequ);
n_senales=n(1);
z=1; d=1; j=1; N=2; m=1; p=0;

while z<=n_senales
freq=frequ(z,:);
% freq(60)=60;
n=0;


%%AMPLITUDE OF FREQUENCY

an=[abs(f_o-min(freq)) abs(f_o-max(freq))];
am(z)=max(an);


%%ROCOF

rocof(z,:)=freq(2:length(freq))-freq(1:length(freq)-1)./1;
%salida = logical([0 sign(rocof(1:end-1))-sign(rocof(2:end))]);
de(z)=max(rocof(z,:));


%%DAMPING EVALUATION
% while j==1
%    if freq(d)>=freq_lim(1) && freq(d)<=freq_lim(2) 
%        d=d+1;
%    else
%        j=2;
%    end
%    if d==length(freq)-1
%     j=2;
%    end
% end
% while m==1
%     if (freq(N)>freq_lim(2) && freq(N-1)>freq(N)) || (freq(N)<freq_lim(1) && freq(N-1)<freq(N))
%        N=N+1;
%        p=p+1;
%     else
%         N=N+1;
%     end
%     if p==2 || N==length(freq)-1
%     m=2;
%     end
% end




%%
d=1;
N=1000;
M=length(freq);
%%
for k=(N+d):1:(M-N-d)
suma=0;
    for m=2:1:N+1
        if freq(k+m)==freq(k+m-1)
            numerador=10e-8;
        else
            numerador=abs(freq(k+m)-freq(k+m-1));
        end
        if freq(m)==freq(m-1)
            denominador=10e-3;
        else
%             denominador=abs(freq(m)-freq(m-1));
            denominador=abs(freq(m+d)-freq(d+m-1));
%             denominador=abs(freq(m)-freq(m-1));
        end
            suma=log10(numerador/denominador)+suma;
    end
le(k)=suma*(1/N);
end




suma1=0;
for k=(N+d):1:(M-N-d)
    %suma1=imag(le(k))+suma1;
    suma1=le(k)+suma1;
end
ale(z)=suma1/(M-2*N-d);
hold on
figure(1)
plot(frequ')
% figure(2)
% plot(rocof')
figure(3)
plot(le)
% plot(imag(le))
% figure(3)
% plot(diff(freq))
% figure(4)
% plot(salida)
hold off
z=z+1;
% figure(1)
% plot(le)
% figure(2)
% plot(freq)
end

d_am(i)=sum(am)/n_senales;
d_de(i)=sum(de)/n_senales;
d_le(i)=sum(ale)/n_senales;


% y=[ale; de; am];
% plot(y)
% figure(4)
% bar(ale,'stacked')
% hold on
% bar(de)
% bar(am)
% hold off
% gi(i,1)=i;
% gi(i,2)=0;
%fsload(i,2)=0;
end
w1=35/50;
w3=2/50;
w2=1;

d_le=d_le/w1;
d_am=d_am/w3;
d_de=d_de*w2;


index=d_am.*sign(d_le)/max(d_am)+d_de.*sign(d_le)/max(d_de)+d_le/max(d_le);
y=[d_le/max(d_le); d_am/max(d_am); d_de/max(d_de)];
norma=max(d_le/max(d_le)+d_am/max(d_am)+d_de/max(d_de));
ww=y';


% pl=sortrows([(index/norma)' ww/norma gi]);
% save('generatoreventssineolica.mat','pl'); 
% pl=sortrows([(index/norma)' ww/norma fsload]);
% save('loadeventssineolica.mat','pl'); 


%  pl=sortrows([(index/norma)' ww/norma gen_place(:,1)]);
%  pl=sortrows([(index/norma)' ww/norma B(:,1)]);
pl=sortrows([(index/norma)' ww(:,1)/norma ww(:,2:3).*sign(ww(:,1))/norma gen_place]);
 save('wind_20_trip_Gen_V_cos_lyap.mat','pl'); 

hold on
figure(1)
bar(pl(:,2:4),'stacked')
% bar(pl(:,2:4))
plot(pl(:,1))
xlabel("Ranking of faults by severity")
ylabel("Performance value")
title("Ranking of Severity")
legend({'Lyapunov Exponent','RoCoF','Maximum Amplitude','Index Value'},'Location','northwest')
% legend({'Lyapunov Exponent','RoCoF','Maximum Amplitud'},'Location','northwest')
hold off
% bar(d_am)
% hold on
% bar(d_de)
% bar(d_le)
% hold off
% figure(2)
% plot(time,frequ')

% figure
% hold on
% plot(frequ(60,:)')
% plot(frequ(25,:)')
% plot(frequ(50,:)')
% hold off









