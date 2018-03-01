images_struct = load('train_shuffle.mat');

test_set = load('test_shuffle.mat');
test_labels = test_set.test_struct.label;
images_label = images_struct.train_struct.label;
%images_pca_mat = load('pca_output_train.mat');

images_pca_mat = load('new_feature.mat');
%test_pca_mat = load('pca_output_test.mat');
test_mat = load('test_new_feature.mat');
%test_mat = load('test_factor_20_feature.mat');

%test_images_label = 
%model = libsvmtrain(images_label', images_pca_mat.pca_output_train, '-c 2 -g 0.002 -v 5');
tic
model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 2 -t 0');
toc
%model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 500  -g 0.000005 -v 5');
%model = libsvmtrain(images_label', images_pca_mat.output', '-c 3 -g 0.002  -v 5');
% in sample test
[train_predict_label, train_accuracy, train_dec_values] = libsvmpredict(test_labels', test_mat.output_feature', model);
% out of sample test
%[test_predict_label, test_accuracy, test_dec_values] = libsvmpredict(test_labels', test_pca_mat.pca_output_test, model);