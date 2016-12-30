input_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\Smaller_Training_Letters';
image_dims = [38,24];
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
images = [];


% Create the matrix, images, ((38*24) x 26) = (Pixel Dimension x Number of Letters) 
for n = 1:num_images
   filename = fullfile(input_dir,filenames(n).name);
   img = imread(filename, 'BackgroundColor', [1 1 1]);
   img = im2double(img);
   img = rgb2gray(img);
   images(:, n) = img(:);
  %  images = imresize(img,[38*24,num_images]);
end

% steps 1 and 2: find the mean image and the mean-shifted input images
mean_let = mean(images, 2);
images = images - repmat(mean_let, 1, num_images);

% steps 3 and 4: calculate the ordered eigenvectors and eigenvalues
[evectors, score, evalues] = pca(images');


% step 5: only retain the top 'num_eigenfaces' eigenvectors (i.e. the principal components)
num_eigenfaces = 14;
evectors = evectors(:, 1:num_eigenfaces);

% step 6: project the images into the subspace to generate the feature vectors
features = evectors' * images;

test_dir= 'C:\Users\Beverly\Documents\MATLAB\535\Project\Test_Images';
test_img_dims = [38,24];
 
test_files = dir(fullfile(test_dir, '*.png'));
fileID = fopen('small_text_message.txt','w');
test_num = numel(test_files);
%Classification
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
% display the result
    figure, imshow([input_image reshape(images(:,match_ix), image_dims)]);
    title(sprintf('matches %s, score %f', filenames(match_ix).name, match_score));
end 
 %Display
 
% display the eigenvectors
figure;
for n = 1:num_eigenfaces
    subplot(2, ceil(num_eigenfaces/2), n);
    evector = reshape(evectors(:,n), image_dims);
    imshow(evector);
end
 
% display the eigenvalues
normalised_evalues = evalues / sum(evalues);
figure, plot(cumsum(normalised_evalues));
xlabel('No. of eigenvectors'), ylabel('Variance accounted for');
xlim([1 30]), ylim([0 1]), grid on;

