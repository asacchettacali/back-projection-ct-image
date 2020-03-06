function [ EM_diagonal ] = emDiagonal( CP, sensors )
    %   UNTITLED3 Summary of this function goes here
    %   Detailed explanation goes here
    
    % Set minium index for diagonal sum
    k = -(sensors-1);
    
    % Initialize diagonal matrix
    EM_diagonal = zeros(sensors,sensors);
    n = 1;
    c = 1;
   
    % Push all diagonal sum into the vector
    while k < sensors

        z(1,1:sensors) = CP(1, c) / n;
        diagonal = diag(z, k);
        EM_diagonal = EM_diagonal + diagonal(1:sensors, 1:sensors);
        
        if k < 0
            n = n+1;
        else
            n = n-1;
        end
          
        k = k+1;
        c = c+1;

    end    
end

