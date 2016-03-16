function [ jac ] = qx_jac( q_vec, x_vec )
%Q_JAC Returns a numerical jacobian of dx/dq

% This method needs some work.

DELTA_H = 0.000000001;

jac = zeros(length(x_vec),length(q_vec));

% dx1/dq1  dx1/dq2  ...  dx1/dqN
% dy1/dq1  dy1/dq2  ...  dy1/dqN
% dx2/dq1  ...      ...  ...
% ...      ...      ...  ...
% dyn/dq1  dyn/dq2  ...  dyn/dqN

for i = 1:length(x_vec)
    for j = 1:length(q_vec)
        jac(i,j) = (1/DELTA_H)*((x_vec(i)+DELTA_H) - q_vec(j));
    
    end
end

end