original_struct = load('test_demo.mat');
test_struct = original_struct.image_struct;

gaborArray = gaborFilterBank(5,8,39,39);

I = test_struct.images_cropped{1};
I = im2double(reshape(I, [200, 200]));
output_feature = gaborFeatures(I,gaborArray,10,10);

test_labels = -1;
model_struct = load('SVM_trained_model');
model = model_struct.model;
[test_predict_label, test_accuracy, test_dec_values] = libsvmpredict(test_labels', output_feature', model);