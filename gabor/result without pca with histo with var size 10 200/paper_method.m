original_struct = load('train_shuffle.mat');
train_struct = original_struct.train_struct;
Sigma=2^0.5*pi;
Size=10;
Size=Size/2;
Sigma=Sigma^2;

output_feature = zeros(8040, 454);
for j = 1 : size(train_struct.image_mat, 2)
    I = train_struct.image_mat(:, j);
    I = im2double(reshape(I, [200, 200])); % try im2double
    %I = im2double(imresize(I, [20, 20]));
    one_image_feature = zeros(201, 40);
    for u = 0 : 7
        for v = 0 : 4
            kv=pi*(2^((-(v+2))/2));
            U=u*pi/8; 
            k=[kv*cos(U),kv*sin(U)];
            for x = -Size:Size
                for y = -Size:Size
                    G(Size+x+1,Size+y+1) =k*k'/Sigma*exp(-k*k'*(x^2+y^2)/(2*Sigma))*(exp(1i*k*[x,y]')-exp(-Sigma/2));
                end
            end
            Imgabout = conv2(I,imag(G),'same');
            Regabout = conv2(I,real(G),'same');
            gabout = (sqrt(Imgabout.*Imgabout + Regabout.*Regabout));
            %smaller = imresize(gabout, [20, 20]);
%             smaller = gabout;
%             one_col = smaller(:);
            variance = var(gabout);
            variance = [variance, mean(mean(gabout))];
            one_image_feature(:, 5 * u + v + 1) = variance';
        end
    end
    one_col_image = one_image_feature(:);
    output_feature(:, j) = one_col_image;
end