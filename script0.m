close all;
clear all;
clc;
pkg load control
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

%impulso unitario de T1 e T2
y1 = impulse(T1, t);
y2 = impulse (T2, t);
figure, plot(t, y1, t, y2);
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao Impulso');
legend('T1', 'T2');

%degrau unitario de T1 e T2
y3 = step(T1, t);
y4 = step(T2, t);
figure, plot(t, y3, t, y4);
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');
legend('T1', 'T2');

%rampa unitaria de T1 e T2
y5 = step(T1/s, t);
y6 = step(T2/s, t);
figure, plot(t, y5, t, y6);
xlabel('Tempo(s)');
ylabel('Amplitude (S.I)');
title('Resposta a rampa');
legend('T1', 'T2');

%u(t) = 2*sin(30*t) + 1*cos(t) para T1 e T2
u = 2*sin(30*t) + cos(t);
y7 = lsim(T1, u, t);
y8 = lsim(T2, u, t);
figure, plot(t, y7, t, y8);
xlabel('Tempo(s)');
ylabel('Amplitude (S.I)');
title('Resposta a u(t) genérico');
legend('T1', 'T2');

