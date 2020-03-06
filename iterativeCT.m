function [ EM ] = iterativeCT( O, sensors, sequence)

    % CT Iterative Reconstruction
   
    % Recorded Projection along direction 1 (vertical sum)
    % QUESTA RIGA VIENE FORNITA
    % RP_1 = sum(O);
    RP_1 = [0 0 4 16 4 0 0];

    % Redistribution Vector along direction 1
    EM_row = RP_1 ./ sensors;

    % Estimated Matrix along direction 0° by duplicating the row t times
    EM = repmat(EM_row, sensors, 1);

    % Obtain the grayscale intensity and plot first guess matrix
    I = mat2gray(EM);
    
    % Primo grafico
    figure
    subplot(1, length(sequence), 1);
    imshow(I);
    title(sequence(1))
    
    for i = 2:length(sequence)
        
        % Caso 45°
        if sequence(i) == 45
            
            % Somma diagonale di EM per ottenere Estimated Projection
            % Riga
            EP = diagonalSum( EM, sensors );
            
            % Somma diagonale di O per ottenere Recorded Projection
            % Riga
            % RP = diagonalSum( O, sensors ); % QUESTA RIGA VIENE FORNITA
            RP = [0 0 0 0 2 4 8 6 4 0 0 0 0];

            
            % Ottengo la Compensating Profile
            % Riga
            CP = RP - EP;
            
            % Distribuzione dei valori in diagonale
            CM = emDiagonal(CP, sensors);
            
        % Caso 135°
        elseif sequence(i) == 135
            
            % TEMPORANEO, DA FARE
            CM = zeros(sensors, sensors);
            
        % Caso 90° o 270°
        elseif (sequence(i) == 90 || sequence(i) == 270)
            
            % Somma orizzontale di EM per ottenere Estimated Projection
            % Colonna
            EP = sum(EM,2);
            
            % Somma orizzontale di O per ottenere Recorded Projection
            % Colonna
            % RP = sum(O,2); % QUESTA RIGA VIENE FORNITA
            RP = [0; 1; 4; 12; 6; 1; 0];
            
            % Ottengo la Compensating Profile
            % Colonna
            CP = RP - EP;
            
            % Colonna dei valori distribuiti
            CM_column = CP ./ sensors;
            
            % Duplico la colonna per il numero di sensori
            CM = repmat(CM_column, 1, sensors);
        
        % Caso 0° o 180°
        elseif (sequence(i) == 0 || sequence(i) == 180)
            
            % Somma orizzontale di EM per ottenere Estimated Projection
            % Riga
            EP = sum(EM);
            
            % Somma orizzontale di O per ottenere Recorded Projection
            % Riga
            % RP = sum(O); % QUESTA RIGA VIENE FORNITA
            RP = [0 0 4 16 4 0 0];
            
            % Ottengo la Compensating Profile
            % Riga
            CP = RP - EP;
            
            % Riga dei valori distribuiti
            CM_row = CP ./ sensors;
            
            % Duplico la riga per il numero di sensori
            CM = repmat(CM_row, sensors, 1);
        end

        % Estimated Matrix
        EM = EM + CM;

        % Obtain the grayscale intensity and plot
        I = mat2gray(EM);
        subplot(1, length(sequence), i);
        imshow(I);
        title(sequence(i))
        
    end

end

