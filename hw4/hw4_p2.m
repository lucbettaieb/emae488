% Luc Bettaieb 2016
% EMAE 488: Advanced Robotics
% Homework 4, Problem 2
clear all;

t = 0:0.1:5;

t0 = 0;
t1 = 2;
t2 = 5;

theta_t0 = 0;
theta_t1 = 45;
theta_t2 = 135;

theta_dot_t0 = 0;
theta_dot_t1 = 15;
theta_dot_t2 = 0;

a0 = theta_t0;
a1 = theta_dot_t0;
a2 = ((3/(t2.^2))*(theta_t1-theta_t0)) - (2/t2)*theta_dot_t0 - (1/t2)*theta_dot_t1;
a3 = (-2/(t2.^3))*(theta_t1-theta_t0) + (1/(t2.^2))*(theta_dot_t1+theta_dot_t0);

y1 = @(x) a0 + a1*x + a2*x.^2 + a3*x.^3;
y1dot = @(x) a1 + 2*a2*x + 3*a3*x.^2;
y1dotdot = @(x) 2*a2 + 6*a3*x

%first graph
figure;
plot(t,y1(t), t, y1dot(t), t, y1dotdot(t));

a0 = theta_t1;
a1 = theta_dot_t1;
a2 = ((3/(t2.^2))*(theta_t2-theta_t1)) - (2/t2)*theta_dot_t1 - (1/t2)*theta_dot_t2;
a3 = (-2/(t2.^3))*(theta_t2-theta_t1) + (1/(t2.^2))*(theta_dot_t2+theta_dot_t1);

y2 = @(x) a0 + a1*x + a2*x.^2 + a3*x.^3;
y2dot = @(x) a1 + 2*a2*x + 3*a3*x.^2;
y2dotdot = @(x) 2*a2 + 6*a3*x

%second graph
figure;
plot(t,y2(t), t, y2dot(t), t, y2dotdot(t));


