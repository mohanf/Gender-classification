i = 3;
I = collection.images{i};
% imshow('BioID_0253.pgm');
outer_struct = load('struct_BioID.mat');
collection = outer_struct.struct_BioID;
% Create a detector object.
faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
% Detect faces.
    bboxes_face = step(faceDetector, I);
    if size(bboxes_face, 1) == 0
        eye_pos_cell{end + 1} = [-1, -1, -1, -1];
        
    end
% Convert bboxes to cell arrays
    bboxesCell_face = mat2cell(bboxes_face,ones(size(bboxes_face,1),1),size(bboxes_face,2));
% %% Crop detected faces.

facesCropped = cellfun(@(x)imcrop(I,x),bboxesCell_face,'UniformOutput',false);
% %% Display a cropped image
% figure;
imshow(facesCropped{1});
% % for i = 1:size(bboxes,1)
% %     rectangle('Position',bboxes(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
% % end

eyeDetector = vision.CascadeObjectDetector('ClassificationModel', 'RightEye', 'UseROI', true);
    bboxes_eyes = step(eyeDetector, I, bboxesCell_face{1});
    if size(bboxes_eyes, 1) < 2
        eye_pos_cell{end + 1} = [-1, -1, -1, -1];
        
    end
    if bboxes_eyes(1, 1) < bboxes_eyes(2, 1)
        bboxes_eye_left = bboxes_eyes(1, :)
        bboxes_eye_right = bboxes_eyes(2, :)
    else
        bboxes_eye_right = bboxes_eyes(1, :)
        bboxes_eye_left = bboxes_eyes(2, :)
    end
    bboxesCell_eyes = mat2cell(bboxes_eyes,ones(size(bboxes_eyes,1),1),size(bboxes_eyes,2));
    eyeCropped = cellfun(@(x)imcrop(I,x),bboxesCell_eyes,'UniformOutput',false);
    figure;
    imshow(eyeCropped{3});
%bboxesCell_eye_left = mat2cell(bboxes_eye_left,ones(size(bboxes_eye_left,1),1),size(bboxes_eye_left,2));
%eyeCropped = cellfun(@(x)imcrop(I,x),bboxesCell_eye,'UniformOutput',false);
%imshow(eyeCropped{1});
    eye_pos_left_x = floor(bboxes_eye_left(1) + bboxes_eye_left(3) / 2);
    eye_pos_left_y = floor(bboxes_eye_left(2) + bboxes_eye_left(4) / 2);
    eye_pos_right_x = floor(bboxes_eye_right(1) + bboxes_eye_right(3) / 2);
    eye_pos_right_y = floor(bboxes_eye_right(2) + bboxes_eye_right(4) / 2);
    eye_pos = [eye_pos_left_x, eye_pos_left_y, eye_pos_right_x, eye_pos_right_y];
    eye_pos_cell{end + 1} = eye_pos;