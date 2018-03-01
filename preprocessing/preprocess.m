% % faceDetector = vision.CascadeObjectDetector();
% % image = im2double(imread('BioID_0000.pgm'));
% % facebox = step(faceDetector, image);
% % finalImage = insertShape(image, 'Rectangle', facebox);
% % figure;
% % imshow(finalImage);
% 
% %% Create a detector object.
%   faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceCART');
% %% Read input image.
% I = imread('BioID_0000.pgm');
% imshow('BioID_0000.pgm');
% figure;
% %% Detect faces.
% bboxes = step(faceDetector, I);
% %% Convert bboxes to cell arrays
% bboxesCell = mat2cell(bboxes,ones(size(bboxes,1),1),size(bboxes,2));
% %% Crop detected faces.
% facesCropped = cellfun(@(x)imcrop(I,x),bboxesCell,'UniformOutput',false);
% %% Display a cropped image
% imshow(facesCropped{1});

Files=dir(['BioID-FaceDatabase-V1.2']);
path = 'BioID-FaceDatabase-V1.2';
c = {};
filenames = {};
for k=1:length(Files)
   FileNames=Files(k).name;
   [filepath,name,ext] = fileparts(FileNames);
   if strcmp(ext, '.pgm') == 1
       filenames{end + 1} = FileNames;
       img = imread([path  '/' FileNames]);
       c{end + 1} = medfilt2(img);
   end
end
struct_BioID = struct;
struct_BioID.images = c;
struct_BioID.names = filenames;