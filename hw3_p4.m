% set up x vector
% set up q vector
% get jacobian dx/dq
% get mass matrix (M = J'M^J)

% variable for the number of linkages.
n = 7;

q_soft = zeros(1:n);
for i = 1:n
    q_soft(i) = 'theta'+i;
end

q_hard = zeros(1:n);
for i = 1:n
   q_hard(i) = 'L'+i; 
end

q = q_soft + q_hard;

x