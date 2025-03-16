% Parametry anteny
A = 0.075;  % szerokość apertury (w metrach)
B = 0.052; % wysokość apertury (w metrach)
Ra = 0.145; % promień krzywizny w płaszczyźnie E (w metrach)
Rb = 0.145; % promień krzywizny w płaszczyźnie H (w metrach)

f = 10e9; % częstotliwość (w Hz)
lambda = 3e8 / f; % długość fali (w metrach)
k = 2 * pi / lambda; % liczba falowa (w rad na metr)
r = 1; % odległość w polu dalekim (w metrach)

% Zakresy kątów
theta = linspace(0, pi, 180); % kąt theta od 0 do 180 stopni w radianach
phi_E = pi/2; % phi dla płaszczyzny E (90 stopni)
phi_H = 0; % phi dla płaszczyzny H (0 stopni)

% Funkcje F1 i F0
F1 = @(u, sigma) integral(@(xi) cos(pi*xi/2) .* exp(1j*pi*u*xi) .* exp(-1j*(pi/2)*sigma^2*xi.^2), -1, 1);
F0 = @(u, sigma) integral(@(xi) exp(1j*pi*u*xi) .* exp(-1j*(pi/2)*sigma^2*xi.^2), -1, 1);

% obliczenia charakterystyk promieniowania
E_theta_phi_E = zeros(size(theta)); % pusta tablica do przechowywania później obliczonych charakterystyk dla phi = pi/2
E_theta_phi_H = zeros(size(theta)); % pusta tablica do przechowywania później obliczonych charakterystyk dla phi = 0

for i = 1:length(theta) % przejście przez każdą wartość theta
    theta_i = theta(i);
    sigma_a = A^2 / (2 * lambda * Ra);
    sigma_b = B^2 / (2 * lambda * Rb);
    ux_E = A / lambda * sin(theta_i) * cos(phi_E);
    uy_E = B / lambda * sin(theta_i) * sin(phi_E);
    ux_H = A / lambda * sin(theta_i) * cos(phi_H);
    uy_H = B / lambda * sin(theta_i) * sin(phi_H);
    E_theta_phi_E(i) = abs((1j * exp(-1j*k*r) / (lambda*r)) * (1 + cos(theta_i)) / 2 * sin(phi_E) * F1(ux_E, sigma_a) * F0(uy_E, sigma_b));
    E_theta_phi_H(i) = abs((1j * exp(-1j*k*r) / (lambda*r)) * (1 + cos(theta_i)) / 2 * cos(phi_H) * F1(ux_H, sigma_a) * F0(uy_H, sigma_b));
end

% Normalizacja wyników do 0 dB
E_theta_phi_E_dB = 20*log10(E_theta_phi_E / max(E_theta_phi_E));
E_theta_phi_H_dB = 20*log10(E_theta_phi_H / max(E_theta_phi_H));

% Tworzenie wykresów dla phi = pi/2
figure;
subplot(2,1,1);
hold on;
grid on;
plot(theta * 180 / pi, E_theta_phi_E_dB, 'b', 'DisplayName', 'Płaszczyzna E');
xlabel('Kąt \theta [stopnie]');
ylabel('E/E_{max} [dB]');
title('Charakterystyka promieniowania anteny tubowej przy 10 GHz');
legend;
ylim([-50 0]);
yticks(-50:5:0);
xticks(0:15:180);
hold off;

% Tworzenie wykresów dla phi = 0
subplot(2,1,2);
hold on;
grid on;
plot(theta * 180 / pi, E_theta_phi_H_dB, 'r', 'DisplayName', 'Płaszczyzna H');
xlabel('Kąt \theta [stopnie]');
ylabel('E/E_{max} [dB]');
title('Charakterystyka promieniowania anteny tubowej przy 10 GHz');
legend;
ylim([-50 0]);
yticks(-50:5:0);
xticks(0:15:180);
hold off;
