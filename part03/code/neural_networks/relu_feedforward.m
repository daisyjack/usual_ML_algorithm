function [ out ] = relu_feedforward( in )
%The feedward process of relu
%   inputs:
%           in	: the input, shape: any shape of matrix
%   
%   outputs:
%           out : the output, shape: same as in

% TODO
%in = [1,2;-1,4];
in(in < 0) = 0;
out = in;
end
