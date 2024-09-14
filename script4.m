clc;
clear all;
close all;

pkg load control
%vetor de tempo de simulacao
t_init = 0; %inicio da simulacao
t_final =6; %fim da simulacao
dt = 0.01; %a cada 1milisegundo tem-se um ponto na simulacao (passo da sim)

%t = t_init:dt:t_final; %vetor de tempo [dominio - x]
t=0:0.001:100; %vetor de tempo


%operador de Laplace

s=tf('s'); %s vira o operador de Laplace

FT=(10*(s+1))/(2*(s*s*s)+4*(s*s)+3*s+5)
y1 = step(FT, t);
figure, plot(t, y1, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');


FT2=(10*(s+1))/(2*(s*s*s)+4*(s*s)+3*s+7)
y2 = step(FT2, t);
figure, plot(t, y2, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');


FT3=(40*(s+10))/((s*s*s)+8*(s*s)+(s*55)+400)
y3 = step(FT3, t);
figure, plot(t, y3, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');

FT4=(61*(s+10))/((s*s*s)+8*(s*s)+(s*76)+610)
y4 = step(FT4, t);
figure, plot(t, y4, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');

FT5=(60*(s+10))/((s*s*s)+8*(s*s)+(s*75)+600)
y5 = step(FT5, t);
figure, plot(t, y5, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');
