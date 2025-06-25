function edge = laplacian_edge_detect(img, threshold)
    if nargin < 2
        threshold = 0.1;  % Default threshold
    end

    % Manual grayscale conversion
    if size(img, 3) == 3
        img = 0.299 * img(:,:,1) + 0.587 * img(:,:,2) + 0.114 * img(:,:,3);
    end

    % Gaussian blur (3x3 kernel)
    gauss_kernel = [1 2 1; 2 4 2; 1 2 1] / 16;
    padded = padarray(img, [1 1], 'replicate');
    blurred = zeros(size(img));
    for i = 2:size(padded,1)-1
        for j = 2:size(padded,2)-1
            region = padded(i-1:i+1, j-1:j+1);
            blurred(i-1,j-1) = sum(sum(region .* gauss_kernel));
        end
    end

    % Laplacian kernel
    lap_kernel = [0 -1 0; -1 4 -1; 0 -1 0];
    padded = padarray(blurred, [1 1], 'replicate');
    edge_raw = zeros(size(blurred));
    for i = 2:size(padded,1)-1
        for j = 2:size(padded,2)-1
            region = padded(i-1:i+1, j-1:j+1);
            edge_raw(i-1,j-1) = sum(sum(region .* lap_kernel));
        end
    end

    % Normalize and apply threshold
    edge_norm = mat2gray(abs(edge_raw));  % Normalize to [0,1]
    edge = edge_norm > threshold;         % Keep edge = 1, background = 0
    
    % Optionally, you can apply a dilation to thicken the edges
    edge = imdilate(edge, strel('square', 3));  % This is dilation with a 3x3 square kernel
        % Invert to get black edges on white background
    edge = im2double(~edge);
end
