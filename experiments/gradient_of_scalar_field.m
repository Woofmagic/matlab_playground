% Date created: 20260916
% Last updated: 20261011
%
% Description:
%
% Notes: 
%   1. 2026/10/29:
%       MATLAB's gradient() uses central differences for non-edge numbers.
%       Interesting! 

%% Experiment 1: Scalar Field in 1D:

% gotta be careful: its call signature with a single variable is actually
% going to create an NxN matrix... So, to make a vector, we need to specify
% two arguments:
scalar_field = 10.0 * rand(10, 1);

scalar_field

% gradient of scalar field in one dimension = total derivative:
% wihtout specifying grid size, it assumes it's delta X = 1.0:
partial_f_partial = gradient(scalar_field);

% seems like the gradient is taken with the forward difference:
partial_f_partial

% Let's check the forward difference here:

new_scalar_field = [10.0, 9.0, 7.5, 6.0, 2.0, 4.0, 5.0, 6.0, 8.0, 11.0];

gradient_of_new_scalar = gradient(new_scalar_field);

% since h = 1.0, we should see this: 
% [-1.0, -1.5, -1.5, -4.0, +2.0, +2.0, +1.0, +1.0, +2.0, +3.0]
gradient_of_new_scalar

% Alright, we instead saw this:
% [-1, -1.25, -1.25, -2.75, -1, 1.5, 1, 1.5, 2.5, 3]
% That's gotta be the central difference:

%% Experiment 2: Scalar Field in 2D:
third_scalar_field = 10.0 * rand(10, 2);

% what will the standard gradient be if we just pass in the entire 10x10
% matrix?
total_gradient_third_field = gradient(third_scalar_field)

% this is 10 by 2... alright... 
size(total_gradient_third_field)
% OH, that makes sense based on the documentation. It is actually returning
% [Fx, Fy] together even though we did not "deconstruct" (in the JS sense)
% the output... But we can if we want:

[partial_phi_x, partial_phi_y] = gradient(third_scalar_field);
% this should pass
assert( ...
    isequal(size(partial_phi_x),size(partial_phi_y)), ...
    "[ASSERT]: Partial derivative sizes not matching")


