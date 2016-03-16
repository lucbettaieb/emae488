% Luc Bettaieb 2016
% EMAE 488: Advanced Robotics
% Forward Kinematics | Main Program

n_joints = 5;
JOINT_LENGTH_CONST = 1;
POINT_MASS_CONST = 1;

% Set up the q_vec to contain joint variables as well as links
q_vec = zeros(1,2*n_joints-1)';

% Populate the joint position vector with arbitrary initial angles
for k = 1:n_joints
    q_vec(k) = 2*pi*rand;
end

% Populate hard variables (cheating a bit by making them all the same)
for k = n_joints+1:2*n_joints-1
    q_vec(k) = JOINT_LENGTH_CONST;
end

% Set up x_vec based on the q_vec
% Will be a column vector in the form of x1,y1,...,xn,yn
x_vec = zeros(1,2*n_joints)';

s_iter = 1;
h_iter = n_joints+1;
x_iter = 1;
while h_iter <= 2*n_joints-1
    x_vec(x_iter)   = q_vec(h_iter)*cos(); % x term assignment
    x_vec(x_iter+1) = q_vec(h_iter)*sin(); % y iterm assignment
    
    s_iter = s_iter + 1;
    h_iter = h_iter + 1;
    x_iter = x_iter + 2;
end


% Check for singularities?  (Maybe necessary)


% Set up mass matrix, need to derive from constrained mass matrix
% using J'.Mx.J
Mx = eye(n_joints);
Mx = Mx * POINT_MASS_CONST;

% Set up torque command vector
t_vec = zeros(1,n_joints);

for k = 1:n_joints
    t_vec = 0;
end