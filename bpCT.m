function [ f ] = bpCT( M, thetas, step )
    
    % Back Propagation CT image reconstruction

    % Initial spatial index
    x = -3; 
    y = -3;
    
    % Retrieve thetas columns
    [~, tc] = size(thetas);

    % Initialize 2D map function
    f = zeros(7,7);

    while y <= 3

        while x <= 3

            % Reset the sum for the current x,y
            sum = 0;

            % Make calculation for each theta
            for ct = 1:tc 
    
                % Current angle value
                theta   = thetas(ct);
                
                % Calculate cos, sin and t value
                coseno  = x * cosd(theta);
                seno    = y * sind(theta);
                t       = round ( coseno + seno );
    
                % Fixing t values out of range
                if t < -3 || t > 3
                    m = 0;
                else
                    m = M(t+4, ct);
                end

                % Sum all the m values
                sum = sum + m;

                % If this is the latest theta then assign the sum to the f
                % matrix, increasing indexes in order to avoid negative ones
                % x is encoded in columns while y is encoded in rows
                if ct == tc
                    f((7 - y) - 3, x+4) = sum * step;
                end

            end

            % Next x index
            x = x+1;

        end

        % Next y index and reset the x one
        y = y+1;
        x = -3;

    end
end

