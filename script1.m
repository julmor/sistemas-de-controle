clc; %limpa a janela de comando
clear all; %limpa as variaveis
close all;  %fecha todos os graficos abertos

%vetor de tempo de simulacao
t_init = 0; %inicio da simulacao
t_final =10; %fim da simulacao
dt = 0.001; %a cada 1milisegundo tem-se um ponto na simulacao (passo da sim)

t = t_init:dt:t_final; %vetor de tempo [dominio - x]

A1 = 2; %amplitude da cossenoide
f=1; %freq em HZ
y1 = A1*cos(2*pi*f*t); %saida da cossenoide [imagem - y]


figure, plot(t, y1, '-xm') %grafico

xlabel('Tempo em segundos')
ylabel('Amplitude')

axis([0 10 -3  3])

%grafico com duas curvas 

A2 = 1; %amplitude da senoide
f2=0.5; %freq em HZ
y2 = A2*sin(2*pi*f2*t); %saida da senoide [imagem - y]

figure, plot(t, y1, '-xm', t, y2,'-og') %grafico
xlabel('Tempo em segundos')
ylabel('Amplitude')
axis([0 10 -3  3])

%grafico 3D

figure, plot3(t, y1, y2);

