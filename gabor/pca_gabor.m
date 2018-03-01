% pca for gabor
large_struct = load('gabor_output.mat');
original_data_train = large_struct.output_feature;
mean_image_train = mean(original_data_train, 2);
cen_data_train = original_data_train - repmat(mean_image_train, 1, size(original_data_train, 2));
gram_mat_train = cen_data_train' * cen_data_train;
[V_train, D_train] = eigs(gram_mat_train, 400);
V_real_train = normc(cen_data_train * normc(V_train(:, 400)));
pca_output_train = cen_data_train' * V_real_train;