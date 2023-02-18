function a = plot_columns(A)
% PLOT_COLUMNS plots the columns of matrix A in a 2D plane

% Check that the input is a matrix
if ~ismatrix(A)
    error('Input must be a matrix')
end

% Get the number of columns in A
num_points = size(A, 2);

% Create a new figure
figure;

% Plot each column of A as a separate point
plot(A(1,:), A(2,:), 'o');

% Set the x and y limits to include all the points
xlim([min(A(1,:))-1, max(A(1,:))+1]);
ylim([min(A(2,:))-1, max(A(2,:))+1]);

% Label the axes
xlabel('x');
ylabel('y');

% Add a title
title('Points in 2D plane');
end