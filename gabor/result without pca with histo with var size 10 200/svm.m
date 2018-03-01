images_struct = load('train_shuffle.mat');

%test_set = load('test_shuffle.mat');
%test_labels = test_set.test_struct.label;
images_label = images_struct.train_struct.label;
%images_pca_mat = load('pca_output_train.mat');

images_pca_mat = load('gabor_output_var.mat');
%test_pca_mat = load('pca_output_test.mat');

%model = libsvmtrain(images_label', images_pca_mat.pca_output_train, '-c 2 -g 0.002 -v 5');
model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 70 -g 0.33  -v 5');
%model = libsvmtrain(images_label', images_pca_mat.output_feature', '-c 32 -t 1 -d 4  -v 5');
%model = libsvmtrain(images_label', images_pca_mat.output', '-c 3 -g 0.002  -v 5');
% in sample test
%[train_predict_label, train_accuracy, train_dec_values] = libsvmpredict(images_label', images_pca_mat.pca_output_train, model);
% out of sample test
% [test_predict_label, test_accuracy, test_dec_values] = libsvmpredict(test_labels', test_pca_mat.pca_output_test, model);