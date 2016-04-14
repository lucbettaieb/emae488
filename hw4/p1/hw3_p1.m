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

omega = zeros(1, n_links);
omega_dot = zeros(1, n_links);

v = zeros(1, n_links);
v_com_dot = zeros(1, n_links);

f_vec = zeros(1, n_links);

% Outward iterations
for i = 1:n_links
    omega(i) = 
    omega_dot(i) = 
    v(i) = 
    v_com_dot(i) = 
end


