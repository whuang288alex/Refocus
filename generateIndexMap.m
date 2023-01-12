function index_map = generateIndexMap(gray_stack, w_size)
    [H, W, N] = size(gray_stack);
    % Compute the focus measure -- the sum-modified laplacian
    %
    % horizontal Laplacian kernel
    Kx = [0.25 0 0.25;...
           1  -3   1; ...
          0.25 0 0.25];
    Ky = Kx';   % vertical version
    
    % horizontal and vertical Laplacian responses
    Lx = zeros(H, W, N);
    Ly = zeros(H, W, N);
    for n = 1:N
        I = im2double(gray_stack(:,:,n));
        Lx(:,:,n) = imfilter(I, Kx, 'replicate', 'same', 'corr');
        Ly(:,:,n) = imfilter(I, Ky, 'replicate', 'same', 'corr');
    end
    
    % sum-modified Laplacian
    SML = (abs(Lx) .^ 2) + (abs(Ly) .^ 2);
    
    % can also use the absolute value itself
    % this is probably more well-known
    % SML = abs(Lx) + abs(Ly);
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ADD YOUR CODE HERE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    h = fspecial('average', w_size);
    SML = imfilter(SML, h);
    
    index_map = zeros(679, 860);
    for i = 1: 679
        for j = 1: 860
            max_value = NaN;
            max_index = NaN;
            for k = 1:25   
                v = SML(i,j,k);
                if isnan(max_index) || max_value < v
                    max_value = v;
                    max_index = k;
                end
            end
            index_map(i, j) = max_index;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end