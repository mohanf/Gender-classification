original_mat = load('test_shuffle.mat');
original = original_mat.test_struct;
white_struct = struct;
white_struct.images = {};
white_struct.label = zeros(1, 20);
%white_struct.image_mat = zeros(40000, 20);
index_original = [4, 5, 6, 7, 10, 12, 14, 16, 17, 18, 19, 21, 37, 41, 43, 47, 50, 62, 72, 83];
for i = 1 : 20
    white_struct.images{i} = original.images{index_original(i)};
    white_struct.label(:, i) = original.label(:, index_original(i));
    white_struct.image_mat(:, i) = original.image_mat(:, index_original(i));
end