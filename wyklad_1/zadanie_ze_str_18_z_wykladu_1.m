% Autor: Jakub Ploskonka
% 03 2025
% Zadanie z 18 str z wykladu nr 1

clear; close all; clc;


dt = 0.001;
fo = 1; % Hz
T = 1/fo;
dt = T;
t = 0 : dt : 50;

s_t_cos = cos(2*pi*(3/100)*t);

s_t_sin = 1/2 * sin(2*pi*(4/50)*t);

p_n = s_t_cos .* s_t_sin;

q_n = s_t_cos + s_t_sin;

figure (1)
subplot(4,1,1)
stem(t,s_t_cos, LineWidth=2); grid on; hold on;
title('Funkcja s_t cos ');
xlabel('t (czas)'); ylabel('s_t cos'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t_cos)-0.1 max(s_t_cos)+0.1], 'k--'); % oś Y

subplot(4,1,2)
stem(t,s_t_sin, LineWidth=2); grid on; hold on;
title('Funkcja s_t sin');
xlabel('t (czas)'); ylabel('s_t_sin'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t_sin)-0.1 max(s_t_sin)+0.1], 'k--'); % oś Y

subplot(4,1,3)
stem(t,p_n, LineWidth=2); grid on; hold on;
title('Funkcja p_n');
xlabel('t (czas)'); ylabel('p_n'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(p_n)-0.1 max(p_n)+0.1], 'k--'); % oś Y

subplot(4,1,4)
stem(t,q_n, LineWidth=2); grid on; hold on;
title('Funkcja q_n');
xlabel('t (czas)'); ylabel('q_n'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(q_n)-0.1 max(q_n)+0.1], 'k--'); % oś Y

figure (2)


subplot(2,1,1)
stem(t,p_n, LineWidth=2); grid on; hold on;
title('Funkcja p_n');
xlabel('t (czas)'); ylabel('p_n'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(p_n)-0.1 max(p_n)+0.1], 'k--'); % oś Y

subplot(2,1,2)
stem(t,q_n, LineWidth=2); grid on; hold on;
title('Funkcja q_n');
xlabel('t (czas)'); ylabel('q_n'); hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(q_n)-0.1 max(q_n)+0.1], 'k--'); % oś Y