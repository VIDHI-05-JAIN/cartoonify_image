function q_img = quantize_colors(img, levels)
%QUANTIZE_COLORS Uniform color quantization without k-means
%   img    - Input RGB image, expected in double format [0,1]
%   levels - Number of quantization levels per channel (e.g., 4 or 8)

    % If image is not in double format, convert
    if ~isa(img, 'double')
        img = im2double(img);
    end

    % Quantization step size
    step = 1 / levels;

    % Apply quantization to each color channel
    q_img = floor(img / step) * step + step / 2;

    % Ensure values stay within [0, 1]
    q_img = min(q_img, 1);
end
