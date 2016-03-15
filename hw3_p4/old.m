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
    q_soft(i) = 'T'+i; % maybe add +i to this....  maybe we need numbers?
end

q_hard = zeros(1,n); % row vector
for i = 1:n
   q_hard(i) = 'L'+i; % maybe add +i to this....
end

q = q_soft + q_hard; % row vector

x = zeros(1,14); % state vector
x(1) = q_hard(1) * cos(q_soft(1));
x(2) = q_hard(1) * sin(q_soft(1));

k = 2; % Real "i" iterator since we have to jump by 2 each step
for i = 2:2:n
    theta_term = 0; % Term for the summation of the soft variables to k.
    for j = 1:k
        theta_term = theta_term + q_soft(j);
    end
        
    x(i) = q_hard(k) * cos(theta_term);
    x(i+1) = q_hard(k) * cos(theta_term);
    
    k = k + 1;
end





