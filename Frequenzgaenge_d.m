% Variablen
R_1 = 1000;         % Widerstand in Ohm
R_2 = 500;
R_12 = (R_1*R_2) ./ R_1+R_2;
C = 2e-12;        % Kapazität in Coloumb
omega = logspace(2, 15, 100); % Logarithmische Frequenzen von 10^0 bis 10^10

% Berechnung
omega_G = 1 ./ (R*C);  % Grenzfrequenz für Hochpass
U = R_12 * ((omega*j ./omega_G) ./ (1 + (omega*j ./ omega_G))); % Verstärkung U
dB = 20 * log10(U); % Umwandlung in dB
phi = atan(imag(U)./real(U)) * (180 ./ pi);

% Diagramm ohne Marker
figure; % Erstellt die Graphen

% Funktion 1
ax1 = axes(); % Achse der ersten Funktion wird angesprochen
semilogx(omega, dB, 'r', 'LineWidth', 1); % Rote Linie, dickere Darstellung
xlabel('Kreisfrequenz \omega (s^{-1})', 'FontSize', 14);
ylabel('Verstärkung (dB)', 'FontSize', 14);
title('Bode-Diagramm für ein RC-Element (Hochpass)', 'FontSize', 16);
grid on;

% Funktion 2
ax2 = axes(); % Achse der zweiten Funktion wird angesprochen
semilogx(omega, phi, 'g', 'LineWidth', 1); % Grüne Linie, dickere Darstellung
ylabel('\phi in Grad', 'FontSize', 14);
set(ax2, 'Color', 'none', 'YAxisLocation', 'right'); % Achse farblos und nach rechts setzen

% Achsen Überlagern
set(ax1, 'Position', get(ax2, 'Position')); % Hol die Position von Achse 2 und setze sie gleich für Achse 1
set(ax1, 'Box', 'off'); % Kein Kasten um die Achse

% Achsenbeschriftung & Titel setzen
legend(ax1, 'Verstärkung', 'Location', 'Southwest');
legend(ax2, 'Phase', 'Location', 'NorthEast');

% Limits für die entsprechenden Achsen
ylim(ax1, [-50, 100]); % Begrenze Y-Achse auf -50 dB bis +50 dB
ylim(ax2, [-100, 100]); % Begrenze Y-Achse auf -100 Grad bis 100 Grad








