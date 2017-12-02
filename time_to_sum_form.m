function [Kp,Ki] = time_to_sum_form(K1, tau)

Ki = 1/tau;
Kp = K1/Ki;
end