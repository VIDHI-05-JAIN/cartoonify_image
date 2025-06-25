function filtered = apply_median_filter(img)
    [rows, cols] = size(img);
    padded = padarray(img, [1 1], 'replicate');
    filtered = zeros(size(img));
    
    for i = 2:rows+1
        for j = 2:cols+1
            region = padded(i-1:i+1, j-1:j+1);
            sorted = sort(region(:));
            filtered(i-1, j-1) = sorted(5);
        end
    end
end
