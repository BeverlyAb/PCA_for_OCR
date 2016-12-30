function [ img, filenames, num_images, images ] = fileDir( input_dir )
%img = input image, filenames = full dir, num_images = # of img, images
%is flatten matrix of img, with dimensions [Pixel Dim x # of img] 
% =[length*height of img, num_images] 
    
 filenames = dir(fullfile(input_dir, '*.png'));
 [~,order] = sort_nat({filenames.name}); 
 filenames = filenames(order);
 
 num_images = numel(filenames);
    for n = 1:num_images
        filename = fullfile(input_dir,filenames(n).name);
        img = imread(filename, 'BackgroundColor', [1 1 1]);
        img = im2double(img);
        img = rgb2gray(img);
        images(:, n) = img(:);
    end
end

