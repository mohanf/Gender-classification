processed = load('processed_BioID (1).mat');
fid = fopen('Bioid_crop_name_with_mark.csv','wt');
 if fid > 0
     for k=1:size(processed.image_struct.names,2)
         %size(processed.image_struct.images_cropped)
         if size(processed.image_struct.images_cropped{k}, 1) ~= 1
            %size(processed.image_struct.images_cropped) 
            fprintf(fid,'%s\n',processed.image_struct.names{:,k});
         else
            fprintf(fid, '-1\n');
         end
     end
     fclose(fid);
 end