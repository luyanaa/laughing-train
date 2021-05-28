annotationPath = "./DJI_ROCO_CCRC/image_annotation/";
imagePath = "./DJI_ROCO_CCRC/image/";

fileList = dir(imagePath);
n = length(fileList);

baseCnt = 0;
carCnt = 0;
armorCnt = zeros(8);
for i=1:n
    if (mod(i,100)==0) 
        disp(i);
    end
    if strcmp(fileList(i).name,'.') || strcmp(fileList(i).name,'..') || strcmp(fileList(i).name,'.DS_Store')
        continue;
    else
        % Read the given image.
        imageArrays = imread(strcat(imagePath,fileList(i).name));
        % Read the annotation.
        annotationfile = strsplit(fileList(i).name, '.');
        annotationfile = annotationfile{1,1};
        annotationfile = [annotationfile,'.xml'];
        annotation = parseXMLAnnotation(annotationPath+annotationfile);
        % Crop armor
        for armorIndex=1:(max(size(annotation.armor)))
           armorColor = annotation.armor(armorIndex).color;
           armorClass = annotation.armor(armorIndex).class;
           if strcmp(armorClass, 'none')
               continue;
           end
          
           armorPic = imcrop(imageArrays,[annotation.armor(armorIndex).bndbox(1), annotation.armor(armorIndex).bndbox(2), ...
               abs(annotation.armor(armorIndex).bndbox(3)-annotation.armor(armorIndex).bndbox(1)),abs(annotation.armor(armorIndex).bndbox(4)-annotation.armor(armorIndex).bndbox(2))]);
           
           if(isempty(armorPic)) 
               continue;
           end
           if(isempty(armorClass))
               continue;
           end
           picPath = ['./data/armor',num2str(armorClass),'/',num2str(armorCnt(armorClass)),'.jpg'];
           imwrite(armorPic, picPath);
           armorCnt(armorClass) = armorCnt(armorClass)+1;
        end
        % Crop car
        for carIndex=1:max(size(annotation.car))
            carPic = imcrop(imageArrays,[annotation.car(carIndex).bndbox(1), annotation.car(carIndex).bndbox(2), ...
              abs(annotation.car(carIndex).bndbox(3)-annotation.car(carIndex).bndbox(1)),abs(annotation.car(carIndex).bndbox(4)-annotation.car(carIndex).bndbox(2))]);
            if(isempty(carPic)) 
               continue;
            end
            picPath = ['./data/car/', num2str(carCnt), '.jpg'];
            imwrite(carPic,picPath);
            carCnt = carCnt + 1;
        end
        % Crop base
        for baseIndex=1:max(size(annotation.base))
            basePic = imcrop(imageArrays,[annotation.base(baseIndex).bndbox(1), annotation.base(baseIndex).bndbox(2), ...
              abs(annotation.base(baseIndex).bndbox(3)-annotation.base(baseIndex).bndbox(1)),abs(annotation.base(baseIndex).bndbox(4)-annotation.base(baseIndex).bndbox(2))]);
            if(isempty(basePic)) 
               continue;
            end
            picPath = ['./data/base/', num2str(baseCnt), '.jpg'];
            imwrite(basePic,picPath);
            baseCnt = baseCnt+1;
        end
        % Crop Watcher
        for watcherIndex=1:max(size(annotation.watcher))
            watcherPic = imcrop(imageArrays,[annotation.watcher(watcherIndex).bndbox(1), annotation.watcher(watcherIndex).bndbox(2), ...
              abs(annotation.watcher(watcherIndex).bndbox(3)-annotation.watcher(watcherIndex).bndbox(1)),abs(annotation.watcher(watcherIndex).bndbox(4)-annotation.watcher(watcherIndex).bndbox(2))]);
            if(isempty(watcherPic)) 
               continue;
            end
            picPath = ['./data/watcher/', num2str(watcherCnt), '.jpg'];
            imwrite(watcherPic, picPath);
            watcherCnt = watcherCnt + 1;
        end
    end
end

annotationPath = "./DJI_ROCO_NCRC/image_annotation/";
imagePath = "./DJI_ROCO_NCRC/image/";

fileList = dir(imagePath);
n = length(fileList);

for i=1:n
    if (mod(i,100)==0) 
        disp(i);
    end
    if strcmp(fileList(i).name,'.') || strcmp(fileList(i).name,'..') || strcmp(fileList(i).name,'.DS_Store')
        continue;
    else
        % Read the given image.
        imageArrays = imread(strcat(imagePath,fileList(i).name));
        % Read the annotation.
        annotationfile = strsplit(fileList(i).name, '.');
        annotationfile = annotationfile{1,1};
        annotationfile = [annotationfile,'.xml'];
        annotation = parseXMLAnnotation(annotationPath+annotationfile);
        % Crop armor
        for armorIndex=1:(max(size(annotation.armor)))
           armorColor = annotation.armor(armorIndex).color;
           armorClass = annotation.armor(armorIndex).class;
           if strcmp(armorClass, 'none')
               continue;
           end
          
           armorPic = imcrop(imageArrays,[annotation.armor(armorIndex).bndbox(1), annotation.armor(armorIndex).bndbox(2), ...
               abs(annotation.armor(armorIndex).bndbox(3)-annotation.armor(armorIndex).bndbox(1)),abs(annotation.armor(armorIndex).bndbox(4)-annotation.armor(armorIndex).bndbox(2))]);
           
           if(isempty(armorPic)) 
               continue;
           end
           if(isempty(armorClass))
               continue;
           end
           picPath = ['./data/armor',num2str(armorClass),'/',num2str(armorCnt(armorClass)),'.jpg'];
           imwrite(armorPic, picPath);
           armorCnt(armorClass) = armorCnt(armorClass)+1;
        end
        % Crop car
        for carIndex=1:max(size(annotation.car))
            carPic = imcrop(imageArrays,[annotation.car(carIndex).bndbox(1), annotation.car(carIndex).bndbox(2), ...
              abs(annotation.car(carIndex).bndbox(3)-annotation.car(carIndex).bndbox(1)),abs(annotation.car(carIndex).bndbox(4)-annotation.car(carIndex).bndbox(2))]);
            if(isempty(carPic)) 
               continue;
            end
            picPath = ['./data/car/', num2str(carCnt), '.jpg'];
            imwrite(carPic,picPath);
            carCnt = carCnt + 1;
        end
        % Crop base
        for baseIndex=1:max(size(annotation.base))
            basePic = imcrop(imageArrays,[annotation.base(baseIndex).bndbox(1), annotation.base(baseIndex).bndbox(2), ...
              abs(annotation.base(baseIndex).bndbox(3)-annotation.base(baseIndex).bndbox(1)),abs(annotation.base(baseIndex).bndbox(4)-annotation.base(baseIndex).bndbox(2))]);
            if(isempty(basePic)) 
               continue;
            end
            picPath = ['./data/base/', num2str(baseCnt), '.jpg'];
            imwrite(basePic,picPath);
            baseCnt = baseCnt+1;
        end
        % Crop Watcher
        for watcherIndex=1:max(size(annotation.watcher))
            watcherPic = imcrop(imageArrays,[annotation.watcher(watcherIndex).bndbox(1), annotation.watcher(watcherIndex).bndbox(2), ...
              abs(annotation.watcher(watcherIndex).bndbox(3)-annotation.watcher(watcherIndex).bndbox(1)),abs(annotation.watcher(watcherIndex).bndbox(4)-annotation.watcher(watcherIndex).bndbox(2))]);
            if(isempty(watcherPic)) 
               continue;
            end
            picPath = ['./data/watcher/', num2str(watcherCnt), '.jpg'];
            imwrite(watcherPic, picPath);
            watcherCnt = watcherCnt + 1;
        end
    end
end

annotationPath = "./DJI_ROCO_SCRC/image_annotation/";
imagePath = "./DJI_ROCO_SCRC/image/";

fileList = dir(imagePath);
n = length(fileList);

for i=1:n
    if (mod(i,100)==0) 
        disp(i);
    end
    if strcmp(fileList(i).name,'.') || strcmp(fileList(i).name,'..') || strcmp(fileList(i).name,'.DS_Store')
        continue;
    else
        % Read the given image.
        imageArrays = imread(strcat(imagePath,fileList(i).name));
        % Read the annotation.
        annotationfile = strsplit(fileList(i).name, '.');
        annotationfile = annotationfile{1,1};
        annotationfile = [annotationfile,'.xml'];
        annotation = parseXMLAnnotation(annotationPath+annotationfile);
        % Crop armor
        for armorIndex=1:(max(size(annotation.armor)))
           armorColor = annotation.armor(armorIndex).color;
           armorClass = annotation.armor(armorIndex).class;
           if strcmp(armorClass, 'none')
               continue;
           end
          
           armorPic = imcrop(imageArrays,[annotation.armor(armorIndex).bndbox(1), annotation.armor(armorIndex).bndbox(2), ...
               abs(annotation.armor(armorIndex).bndbox(3)-annotation.armor(armorIndex).bndbox(1)),abs(annotation.armor(armorIndex).bndbox(4)-annotation.armor(armorIndex).bndbox(2))]);
           
           if(isempty(armorPic)) 
               continue;
           end
           if(isempty(armorClass))
               continue;
           end
           picPath = ['./data/armor',num2str(armorClass),'/',num2str(armorCnt(armorClass)),'.jpg'];
           imwrite(armorPic, picPath);
           armorCnt(armorClass) = armorCnt(armorClass)+1;
        end
        % Crop car
        for carIndex=1:max(size(annotation.car))
            carPic = imcrop(imageArrays,[annotation.car(carIndex).bndbox(1), annotation.car(carIndex).bndbox(2), ...
              abs(annotation.car(carIndex).bndbox(3)-annotation.car(carIndex).bndbox(1)),abs(annotation.car(carIndex).bndbox(4)-annotation.car(carIndex).bndbox(2))]);
            if(isempty(carPic)) 
               continue;
            end
            picPath = ['./data/car/', num2str(carCnt), '.jpg'];
            imwrite(carPic,picPath);
            carCnt = carCnt + 1;
        end
        % Crop base
        for baseIndex=1:max(size(annotation.base))
            basePic = imcrop(imageArrays,[annotation.base(baseIndex).bndbox(1), annotation.base(baseIndex).bndbox(2), ...
              abs(annotation.base(baseIndex).bndbox(3)-annotation.base(baseIndex).bndbox(1)),abs(annotation.base(baseIndex).bndbox(4)-annotation.base(baseIndex).bndbox(2))]);
            if(isempty(basePic)) 
               continue;
            end
            picPath = ['./data/base/', num2str(baseCnt), '.jpg'];
            imwrite(basePic,picPath);
            baseCnt = baseCnt+1;
        end
        % Crop Watcher
        for watcherIndex=1:max(size(annotation.watcher))
            watcherPic = imcrop(imageArrays,[annotation.watcher(watcherIndex).bndbox(1), annotation.watcher(watcherIndex).bndbox(2), ...
              abs(annotation.watcher(watcherIndex).bndbox(3)-annotation.watcher(watcherIndex).bndbox(1)),abs(annotation.watcher(watcherIndex).bndbox(4)-annotation.watcher(watcherIndex).bndbox(2))]);
            if(isempty(watcherPic)) 
               continue;
            end
            picPath = ['./data/watcher/', num2str(watcherCnt), '.jpg'];
            imwrite(watcherPic, picPath);
            watcherCnt = watcherCnt + 1;
        end
    end
end

annotationPath = "./DJI_ROCO_FT/image_annotation/";
imagePath = "./DJI_ROCO_FT/image/";

fileList = dir(imagePath);
n = length(fileList);

for i=1:n
    if (mod(i,100)==0) 
        disp(i);
    end
    if strcmp(fileList(i).name,'.') || strcmp(fileList(i).name,'..') || strcmp(fileList(i).name,'.DS_Store')
        continue;
    else
        % Read the given image.
        imageArrays = imread(strcat(imagePath,fileList(i).name));
        % Read the annotation.
        annotationfile = strsplit(fileList(i).name, '.');
        annotationfile = annotationfile{1,1};
        annotationfile = [annotationfile,'.xml'];
        annotation = parseXMLAnnotation(annotationPath+annotationfile);
        % Crop armor
        for armorIndex=1:(max(size(annotation.armor)))
           armorColor = annotation.armor(armorIndex).color;
           armorClass = annotation.armor(armorIndex).class;
           if strcmp(armorClass, 'none')
               continue;
           end
          
           armorPic = imcrop(imageArrays,[annotation.armor(armorIndex).bndbox(1), annotation.armor(armorIndex).bndbox(2), ...
               abs(annotation.armor(armorIndex).bndbox(3)-annotation.armor(armorIndex).bndbox(1)),abs(annotation.armor(armorIndex).bndbox(4)-annotation.armor(armorIndex).bndbox(2))]);
           
           if(isempty(armorPic)) 
               continue;
           end
           if(isempty(armorClass))
               continue;
           end
           picPath = ['./data/armor',num2str(armorClass),'/',num2str(armorCnt(armorClass)),'.jpg'];
           imwrite(armorPic, picPath);
           armorCnt(armorClass) = armorCnt(armorClass)+1;
        end
        % Crop car
        for carIndex=1:max(size(annotation.car))
            carPic = imcrop(imageArrays,[annotation.car(carIndex).bndbox(1), annotation.car(carIndex).bndbox(2), ...
              abs(annotation.car(carIndex).bndbox(3)-annotation.car(carIndex).bndbox(1)),abs(annotation.car(carIndex).bndbox(4)-annotation.car(carIndex).bndbox(2))]);
            if(isempty(carPic)) 
               continue;
            end
            picPath = ['./data/car/', num2str(carCnt), '.jpg'];
            imwrite(carPic,picPath);
            carCnt = carCnt + 1;
        end
        % Crop base
        for baseIndex=1:max(size(annotation.base))
            basePic = imcrop(imageArrays,[annotation.base(baseIndex).bndbox(1), annotation.base(baseIndex).bndbox(2), ...
              abs(annotation.base(baseIndex).bndbox(3)-annotation.base(baseIndex).bndbox(1)),abs(annotation.base(baseIndex).bndbox(4)-annotation.base(baseIndex).bndbox(2))]);
            if(isempty(basePic)) 
               continue;
            end
            picPath = ['./data/base/', num2str(baseCnt), '.jpg'];
            imwrite(basePic,picPath);
            baseCnt = baseCnt+1;
        end
        % Crop Watcher
        for watcherIndex=1:max(size(annotation.watcher))
            watcherPic = imcrop(imageArrays,[annotation.watcher(watcherIndex).bndbox(1), annotation.watcher(watcherIndex).bndbox(2), ...
              abs(annotation.watcher(watcherIndex).bndbox(3)-annotation.watcher(watcherIndex).bndbox(1)),abs(annotation.watcher(watcherIndex).bndbox(4)-annotation.watcher(watcherIndex).bndbox(2))]);
            if(isempty(watcherPic)) 
               continue;
            end
            picPath = ['./data/watcher/', num2str(watcherCnt), '.jpg'];
            imwrite(watcherPic, picPath);
            watcherCnt = watcherCnt + 1;
        end
    end
end
