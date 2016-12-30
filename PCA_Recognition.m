image_dims = [30,30];
%image_dims = [45,45];

input_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\30_30_Letters';
%input_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\45_45_Letters';

% Create the matrix, images,[(30*30) x 135] = (Pixel Dimension x Number of Letters + '_') 
[ img, filenames, num_images, images ] = fileDir(input_dir);

% steps 1 and 2: find the mean image and the mean-shifted input images
mean_let = mean(images, 2);
images = images - repmat(mean_let, 1, num_images);

% steps 3 and 4: calculate the ordered eigenvectors and eigenvalues
[evectors, score, evalues] = pca(images');

% step 5: only retain the top 'num_eigenfaces' eigenvectors (i.e. the principal components)
num_eigenfaces = 134;
evectors = evectors(:, 1:num_eigenfaces);

% step 6: project the images into the subspace to generate the feature vectors
features = evectors' * images;

% Classification
% Access all images to be tested and create output textfile

test_img_dims = [30,30];
%test_img_dims = [45,45];
test_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\30_30_Message';
%test_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\45_45_Message';
test_files = dir(fullfile(test_dir, '*.png'));
[~,order] = sort_nat({test_files.name}); 
test_files = test_files(order);

test_num = numel(test_files);
fileID = fopen('large_text_message.txt','w');

for i= 1: test_num
   test_file = fullfile(test_dir,test_files(i).name);
   input_image = imread(test_file, 'BackgroundColor', [1 1 1]);
   input_image = im2double(input_image);
   input_image = rgb2gray(input_image);
   
% calculate the similarity of the input to each training image
    feature_vec = evectors' * (input_image(:) - mean_let);
    similarity_score = arrayfun(@(n) 1 / (1 + norm(features(:,n) - feature_vec)), 1:num_images);
    
% find the image with the highest similarity
    [match_score, match_ix] = max(similarity_score);
    index = trueIndex(match_ix, filenames);
 
% match the images with the correct letter and create text file
    letter = alpha(index);
    fprintf(fileID,letter);
end

