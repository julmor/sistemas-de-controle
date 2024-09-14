close all;
clear all;
clc;

%vetor de tempo para simulacao

t=0:0.001:10;

%operador de Laplace

s=tf('s'); %s vira o operador de Laplace

%funcao de transferencia da planta (t.f)

P=1/(s^2+4*s+5);

%calcula polos
disp('-----------')
disp('Polos MALHA ABERTA')
p=pole(P)
disp('-----------')
disp('Zeros MALHA ABERTA')
%calcula zeros
z=zero(P)

%resposta ao impulso

y1=impulse(P, t); %caso impulso de area 4 => y1=impulse(4*P, t); 
figure, plot(t, y1, '-r');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta impulsiva');


%resposta ao degrau

y2=step(P, t); %caso degrau de amplitude 10 => y2=step(10*P, t)
figure, plot(t, y2, '-g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau');


%resposta a rampa

y3=step(P/s, t); 
figure, plot(t, y3, '-g', t, t, 'g');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta a rampa');
legend('Saída',' Entrada');
%ou

%resposta a rampa

y4=impulse(P/(s*s), t); 
figure, plot(t, y4, '-b');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta a rampa');
legend('Saída', 'Entrada');


%entrada generica
u=10*sin(10*t); %entrada generica no tempo
y5=lsim(P, u, t);
figure, plot(t, y5, '-r', t, u, 'g');
legend('Saída', 'Entrada')
xlabel('Tempo (s)')
ylabel('Amplitude (S.I)')
title('Resposta a rampa')


%Malha fechada 
K = 1/s; %F. T do controlador

H = 1;  %%% F.T  da realimentacao

G = K*P; %%% F.T do ramo direto

T=feedback(G, H); %%% F.T malha fechada

%calcula polos
disp('-----------')
disp('Polos MALHA FECHADA')
p_mf=pole(T)
disp('-----------')
disp('Zeros MALHA FECHADA')
%calcula zeros
z_mf=zero(T)


%resposta ao degrau DA MALHA FECHADA

y6=step(T, t); %caso degrau de amplitude 10 => y2=step(10*P, t)
figure, plot(t, y6, '-m');
legend('Saída', 'Entrada')
xlabel('Tempo (s)');
ylabel('Amplitude (S.I)');
title('Resposta ao degrau da malha fechada');

%Outras entradas, faz a mesma coisa que fizemos para a planta P

