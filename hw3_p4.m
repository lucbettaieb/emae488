% set up q vector
% set up x(q) vector
% get jacobian dx/dq
% get mass matrix (M = J'M^J)

% variable for the number of linkages.
n = 7;

% need to use syms for symbolic varibles
syms q_soft q_hard q x 

q_soft = zeros(1,n); % row vector
for i = 1:n
    q_soft(i) = i; % maybe add +i to this....  maybe we need numbers?
end

q_hard = zeros(1,n); % row vector
for i = 1:n
   q_hard(i) = 'L'; % maybe add +i to this....
end

q = q_soft + q_hard; % row vector

x = zeros(1,14); % state vector
x(1) = q_hard(1) * cos(q_soft(1));
x(2) = q_hard(1) * sin(q_soft(1));

k = 2;
for i = 2:2:n
    x(i) = q_hard(k) * cos(q_soft(k));
    x(i+1) = q_hard(k) * cos(q_soft(k));
    
    k = k + 1;
end




