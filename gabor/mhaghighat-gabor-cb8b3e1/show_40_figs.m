% show features
features = images_pca_mat.output_feature;
one_feature = features(:,1);

for u = 1 : 5
    for v = 1 : 8
        
        i = (u - 1) * 8 + v;
        subplot(5, 8, i);
       one_single_feature = one_feature((i - 1) * 400 + 1: i * 400, :);
       one_resize = imresize(one_single_feature, [20,20]);
       imshow(one_resize);
    end
end
       