% Konstanten
V_max = 1e5;
R1 = 1e3;
R2 = 10e3;
omega_g = 10;
omega = logspace (0, 10, 100);

% Formeln

  % V0
  V0 = - V_max ./ (1 - j*(omega ./ omega_g));

  % in dB
  dB_V0 = 20 .* log10(V0); % Umwandlung in dB

  % Uebertragungsfunktoon
  Vu = -(R2./R1).* (1./ (1-(1./(V0*(R1./(R1+R2))))));

  % in dB
  dB_Vu = 20 * log10(Vu); % Umwandlung in dB

% Plots

semilogx(omega, dB_Vu, 'r', 'LineWidth', 1); % Rote Linie, dickere Darstellung
hold on;
semilogx(omega, dB_V0, 'g', 'LineWidth', 1); % Grüne Linie, dickere Darstellung
grid on;

% Diagramm- und Achsenbezeichnung
xlabel('Kreisfrequenz \omega (s^{-1})', 'FontSize', 14);
ylabel('Verstärkung (dB)', 'FontSize', 14);
title('Übung vom 25.03.2025', 'FontSize', 16);
legend('Vu','V0');
