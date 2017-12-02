function Kp = omega_s_to_kp(omegas)

load Modellparameter.mat;
mu = 5.5e-04;

s1 = -(R/L + mu/J)/2 + sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J));
s2 = -(R/L + mu/J)/2 - sqrt((R/(2*L) + mu/(2*J))^2 - Ke*Km/(L*J));
K = V*Km/(s1*s2*L*J);
tau1 = -1/s1;

syms X;
Kp = vpa(solve(abs(K*X/(1i*tau1*omegas + 1)) == 1, X));
end