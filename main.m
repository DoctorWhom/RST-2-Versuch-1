load Modellparameter.mat;

%% Aufgabe 3.0

% a)
M = magic(10);

% b)
plot(sort(M(7,:)), M(:,3))

% c)
t = 0:2e-3:10;
u = heaviside(t-1);

% d)
simin.time = t;
simin.signals.values = u;
%% Aufgabe 3.1

% a)
s1 = -(R/L + mu/J)/2 + sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J));
s2 = -(R/L + mu/J)/2 - sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J));


% c)

s = tf('s');

K = V*Km/(s1*s2*L*J);
tau1 = -1/s1;
tau2 = -1/s2;

G = K/((tau1 * s + 1)*(tau2 * s + 1));
Gschlange = K/(tau1 * s + 1);

bode(G,Gschlange);
legend({'G', '\~{G}'}, 'Interpreter', 'Latex', 'FontSize', 16);
title('Originale und approximierte �bertragungsfunktion');

%% Aufgabe 3.3

% c)
L = 9/(tau1 * s + 1);
[Gm,Pm,Wgm,Ws] = margin(L);

% d) - in 'omega_s_to_kp.m'

% e)

Cp = omega_s_to_kp(5);
Lp = Cp * Gschlange;
T = feedback(Lp, 1); %F�hrungs�bertragungsfunktion mit Schnittfrequenz 5 rads^-1

t = 0:2e-3:10;
r = 99.48376725 * heaviside(t);

lsim(T,r,t);

%% Aufgabe 3.4

% d)

Ki = 0.007;
Ci = Ki/s;
Lschlange = Ci * Gschlange;

margin(Lschlange); % Bode-Diagramm und Berechnung des Phasenrandes

Ti = feedback(Lschlange, 1);
t = 0:2e-3:10;
r = 99.48376725 * heaviside(t);

y = lsim(Ti,r,t);
Mp = 0;
S = stepinfo(y,t) %Simulation von y und Ausgabe von Mp