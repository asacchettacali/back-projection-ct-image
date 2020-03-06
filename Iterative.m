% Original local absorption map
% Preso da slide
O = [0 0 0 0; 
     0 5 7 0; 
     0 6 2 0;
     0 0 0 0];

% Plot Original local absorption map
% I = mat2gray(O);
% figure
% imshow(I);

% Retrieve number of sensors
% [sensors, ~] = size(O);
sensors = 7;

% Setup the orientation vector
sequence = [0 45 90]; % 135 non è programmata e 180 non aggiunge valore perché uguale a 0°

% Iterate other projections
EM_final = iterativeCT(O, sensors, sequence);


