close all;
clear all;
clc;

t=0:0.001:10; %vetor de tempo
s=tf('s'); %s operador de Laplace

P = 10/(s*(s+1)); %funcao de transferencia da planta (t.f)
K = 1.05*(s+1.5)/(s+3.75); %F. T do controlador
H = 1;  %%% F.T  da realimentacao
G = K*P; %%% F.T do ramo direto

T1=feedback(P, H);
T2=feedback(G, H); %%% F.T malha fechada

%calcula polos
disp('-----------')
disp('Polos T1 MALHA FECHADA')
p_mf=pole(T1)
disp('-----------')
disp('Zeros T1 MALHA FECHADA')
%calcula zeros
z_mf=zero(T1)


%calcula polos
disp('-----------')
disp('Polos T2 MALHA FECHADA')
p_mf=pole(T2)
disp('-----------')
disp('Zeros T2 MALHA FECHADA')
%calcula zeros
z_mf=zero(T2)


y1=impulse(T1, t);
y2=impulse(T2, t);
figure, plot(t, y1, t, y2, '-m', '-g');
legend('Saída', 'Entrada')
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau da malha fechada');
