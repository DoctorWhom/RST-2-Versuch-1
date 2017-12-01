load Modellparameter.mat
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
s1 = -(R/L + mu/J)/2 + sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J))
s2 = -(R/L + mu/J)/2 - sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J))

