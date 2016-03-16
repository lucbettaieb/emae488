function [ out ] = q_sum( q_vec, j )
%Q_SUM sums over q_vec from 1 to j
out = 0;

for i = 1:j
    out = out + q_vec(i);
end
end

