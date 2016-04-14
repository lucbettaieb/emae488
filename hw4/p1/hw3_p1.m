% Luc Bettaieb 2016
% EMAE 488: Advanced Robotics
% Homework 4, Problem 1
clear all;

g = 9.8;

n_links = 10;
m_i = 2;       % 2 for each linkage
l_i = 1;       % 1 for each linkage


% Compute inverse dynamics!

p_c_i = [l_i, 0, 0]';
v_g_i = [0, g, 0]';

% Forward rotation matrix for pi/4 (since theta is given)
R_fwd_pion4 = [ [cos(pi/4), -sin(pi/4), 0]
                [sin(pi/4), cos(pi/4),  0]
                [0,         0,          1]];
            
% Inverse rotation matrix for pi/4 (since theta is given)
R_inv_pion4 = [ [cos(pi/4), sin(pi/4),  0]
                [-sin(pi/4),cos(pi/4),  0]
                [0,         0,          1]];

omega = zeros(3, n_links);
omega_dot = zeros(3, n_links);

v = zeros(3, n_links);
v_com_dot = zeros(3, n_links);

F_vec = zeros(3, n_links);
N_vec = zeros(3, n_links);

% Inital conditions
omega(:,1) = [0,0,0]';
omega_dot(:,1) = [0,0,0]';

v(:,1) = [0,0,0]';
v_com_dot(:,1) = [0,0,0]';

F_vec(:,1) = m_i * v_com_dot(1);
N_vec(:,1) = [0,0,0]';

% Outward iterations
for i = 2:n_links+1
    omega(:,i) = [0,0,0]';
    omega_dot(:,i) = [0,0,0]';
    
    v(:,i) = R_fwd_pion4*(cross(omega_dot(:,i-1), p_c_i) + cross(omega(:,i-1), cross(omega(:,i-1), p_c_i)) + v_g_i );
    v_com_dot(:,i) = cross(omega_dot(:,i), p_c_i) +  cross(omega(:,i), cross(omega(:,i), p_c_i)) + v(:,i);
   
    F_vec(:,i) = m_i * v_com_dot(:,i);
    N_vec(:,i) = [0,0,0]';
end

% Inward iterations
