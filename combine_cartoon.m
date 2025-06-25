function cartoon = combine_cartoon(quantized_img, edges)
    % Ensure edge is double and 2D
    if size(edges, 3) == 3
        edges = rgb2gray(edges);
    end

    % In case edges are not already inverted (black lines, white bg)
    edges = im2double(edges); % Ensure double precision

    % Convert edges to 3 channels
    edge_mask = repmat(edges, [1, 1, 3]);  % Now same size as RGB image

    % Multiply quantized image with edge mask
    % This keeps original colors where edge is white, darkens where edge is black
    cartoon = quantized_img .* edge_mask;
end
