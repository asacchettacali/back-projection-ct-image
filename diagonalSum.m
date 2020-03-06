function [ diagonal_vector ] = diagonalSum( M, sensors )
    % Function that return a vector containing the sum 
    % of all diagonal values in a matrix
    
    % Set minium index for diagonal sum
    k = -(sensors-1);
    
    % Initialize diagonal vector index and Matrix
    diagonal_vector = zeros(1, (sensors*2-1) );
    i = 1;
    
    % Push all diagonal sum into the vector
    while k < sensors
        diagonal_vector(1, i) = sum(diag(M, k));
        i = i+1;
        k = k+1;
    end 
    
    % Retain only central values
    % limit = floor(sensors/2);
    % diagonal_vector = diagonal_vector(sensors - limit : sensors + limit);
end