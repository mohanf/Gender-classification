original_struct = load('train_shuffle.mat');
train_struct = original_struct.train_struct;
output = zeros(400, 454);
for i = 1 : 454
    I = train_struct.image_mat(:, i);
    I = im2double(imresize(I, [20, 20]));
    output(:, i) = I(:);
end