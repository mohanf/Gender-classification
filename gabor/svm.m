images_struct = load('train_shuffle.mat');

test_set = load('test_shuffle.mat');
test_labels = test_set.test_struct.label;
images_label = images_struct.train_struct.label;
%images_pca_mat = load('pca_output_train.mat');

images_pca_mat = load('gabor_output_30_200.mat');
%test_pca_mat = load('pca_output_test.mat');
test_mat = load('gabor_out_test_30.mat');

%model = libsvmtrain(images_label', images_pca_mat.pca_output_train, '-c 2 -g 0.002 -v 5');
%model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 150 -g 1.5');
model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 200 -t 0 -v 5');
%model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 3 -t 1 -d 3');
%model = libsvmtrain(images_label', images_pca_mat.output', '-c 3 -g 0.002  -v 5');
% in sample test
%[train_predict_label, train_accuracy, train_dec_values] = libsvmpredict(test_labels', test_mat.output_feature', model);
% out of sample test
% [test_predict_label, test_accuracy, test_dec_values] = libsvmpredict(test_labels', test_pca_mat.pca_output_test, model);