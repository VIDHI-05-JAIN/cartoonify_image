function gray = to_grayscale(img)
    gray = 0.299 * img(:,:,1) + 0.587 * img(:,:,2) + 0.114 * img(:,:,3);
end
