% Sinogram Matrix
M = [0 0 0 0 0;
     0 2 1 3 0;
     4 4 4 6 4;
     16 8 12 8 16;
     4 6 6 4 4;
     0 4 1 3 0;
     0 0 0 0 0];

% Array of available thetas
thetas = [0 45 90 135 180];

% Angle step
step = pi/4;

% Calculate Unfiltered Back Projection
f_ubp = bpCT(M, thetas, step);

% Show the resulting intensity image
figure
subplot(1, 2, 1);
I = mat2gray(f_ubp);
imshow(I);
title('Unfiltered Back Projection')



% Filter
filter = [0 -1 3 -1 0];
[~, fc] = size(filter);
[mr, mc] = size(M);
M_filtered_rows = mr+fc-1;
M_filtered = zeros(M_filtered_rows, mc);

% Apply the filter on the sinogram M matrix
for j = 1:5
    column = M(:,j);
    filtered = conv(column, filter');
    M_filtered(:,j) = filtered(:,1);
end

% Get central interval (avoiding zero padding)
limit = (M_filtered_rows - mr) / 2;
a = 1+limit;
b = M_filtered_rows-limit;

% Calculate Filtered Back Projection
f_fbp = bpCT(M_filtered(a:b, :), thetas, step);


% Show the resulting intensity image
subplot(1, 2, 2);
I = mat2gray(f_fbp);
imshow(I);
title('Filtered Back Projection')
