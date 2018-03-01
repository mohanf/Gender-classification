original_struct = load('test_shuffle.mat');
train_struct = original_struct.test_struct;
%output_feature = zeros(16000, 454);
output_feature = zeros(4000, 20);
gaborArray = gaborFilterBank(5,8,39,39);
for j = 1 : size(train_struct.image_mat, 2)
    %disp(j);
    I = uint8(train_struct.image_mat(:, j));
    I = im2double(reshape(I, [200, 200]));
    %I = imresize(I, [20, 20]);
    one_image_feature = zeros(400, 40);
    
    featureVector = gaborFeatures(I,gaborArray,20,20);
    %restore = reshape(featureVector, [20, 20]);
    
    output_feature(:, j) = featureVector;
end


    
    