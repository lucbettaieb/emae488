% Luc Bettaieb 2016
% EMAE 488: Advanced Robotics
% Forward Kinematics | Main Program
clear all;

n_joints = 5;
JOINT_LENGTH_CONST = 1;  % this will be in meters
POINT_MASS_CONST = 1;  % this will be in kilograms
INIT_ACC_CONST = 0.1;
INIT_VEL_CONST = 0.8;


% Set up the q_vec to contain joint variables as well as links
q_vec = zeros(1,2*n_joints)';

% Populate the joint position vector with arbitrary initial angles
for k = 1:n_joints
    q_vec(k) = 2*pi*rand;
end

% Populate hard variables (cheating a bit by making them all the same)
for k = n_joints+1:2*n_joints
    q_vec(k) = JOINT_LENGTH_CONST;
end

% Set up x_vec based on the q_vec
% Will be a column vector in the form of x1,y1,...,xn,yn
x_vec = zeros(1,2*n_joints)';
s_iter = 1; % iterator for soft variables 
h_iter = n_joints+1; % iterator for hard variables

x_iter = 3; % iterator for state operations
%while h_iter <= 2*n_joints-1

x_vec(1) = 0;
x_vec(2) = 0;

while x_iter <= 2*n_joints
    x_vec(x_iter)   = x_vec(x_iter-2) + q_vec(h_iter) * cos(q_sum(q_vec, s_iter)); % x term assignment
    x_vec(x_iter+1) = x_vec(x_iter-2) + q_vec(h_iter) * sin(q_sum(q_vec, s_iter)); % y iterm assignment
    
    s_iter = s_iter + 1;
    h_iter = h_iter + 1;
    x_iter = x_iter + 2;
end

% Get Jacobian
J = qx_jac(q_vec, x_vec);

% Check for singularities?  (Maybe necessary)
if det(J) == 0
    error('SINGLUAR JACOBIAN');
end

% Set up mass matrix, need to derive from constrained mass matrix
% using J'.Mx.J
Mx = eye(2*n_joints);
Mx = Mx * POINT_MASS_CONST;

M = J'*Mx*J;

H = inv(M);    % attempt at inverting M
pH = pinv(M);  % pseudo-inverse of M


% Set up torque command vector
t_vec = zeros(1,2*n_joints)';

for k = 1:n_joints
    t_vec = 2; % applying 2 newtons of force to each joint
end

% Was going to run a forward simulation, but not necessary for this
% assignment

% % get soft variables from q_vec
% q_pos = q_vec(1:n_joints);
% % set up velocity vector with initial values
% q_vel = zeros(1,n_joints)';
% t = 0;
% h_step = 0.001;
% t_max = 100; % run forward sim for 100 seconds.
% 
% while t <= t_max
%     for k = 1:n_joints
%        q_pos(k) = q_pos(k) + q_vel(k)*h_step; 
%     end
%     
%     % how do i update q_acc?
%     t = t+h_step;    
% end


% Set up the velocity vector
v_vec = zeros(1,2*n_joints)';

for k = 1:n_joints
    v_vec = 2;
end

% Set up the gravity vector
g_vec = zeros(1,2*n_joints)';

for k = 1:n_joints
    g_vec = POINT_MASS_CONST*9.81;
end

pseudo_q_acc = pH*(t_vec - v_vec - g_vec)

q_acc = H*(t_vec - v_vec - g_vec)

err = q_acc - pseudo_q_acc
