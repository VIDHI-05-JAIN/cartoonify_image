clear; clc;
% Load and normalize image
img = im2double(imread('example.jpg'));  % Replace with your image path

% Step 1: Convert to Grayscale
gray = to_grayscale(img);

% Step 2: Apply Median Filter
smoothed = apply_median_filter(gray);

% Step 3: Edge Detection using Laplacian
edges = laplacian_edge_detect(smoothed, 0.1);  % Use the smoothed image for edge detection

% Step 4: Color Quantization
quantized = quantize_colors(img, 8);  % You can try 4 or 16 colors

% Step 5: Combine to create cartoon effect
cartoon = combine_cartoon(quantized, edges);

% Display and Show all intermediate steps
figure;

% Original Image
subplot(2,3,1); 
imshow(img); 
title('Original Image');

% Grayscale Image
subplot(2,3,2); 
imshow(gray); 
title('Grayscale Image');

% Filtered Image (Smoothed)
subplot(2,3,3); 
imshow(smoothed); 
title('Filtered Image');

% Edge Map (after Laplacian edge detection)
subplot(2,3,4); 
imshow(mat2gray(edges));  % Normalize edge map for display
title('Edge Map');

% Quantized Image
subplot(2,3,5); 
imshow(quantized); 
title('Quantized Image');

% Cartoonified Image
subplot(2,3,6); 
imshow(cartoon); 
title('Cartoonified Image');
