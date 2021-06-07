load('matlab.mat');
imageArrays = imread('高巨毅恒Vs华南虎_BO5_2_0.jpg');
imageArrays = rgb2gray(imageArrays);
figure;
hold on;
imshow(imageArrays);

for rowIndex = 1:10:(1920-25)
    for columnIndex = 1:10:(1080-25)
        pic = imcrop(imageArrays, [rowIndex,columnIndex,25,25]);
        [result,score] = predict(classifier, pic);
        if result~=7
            plot(rowIndex, columnIndex, rowIndex+25, columnIndex, rowIndex+25, columnIndex+25, rowIndex, columnIndex+25, rowIndex, columnIndex);
            disp('YES');
            fprintf("%d\n",result);
        end
    end
end
disp('25');

for rowIndex = 1:20:(1920-50)
    for columnIndex = 1:20:(1080-50)
        pic = imcrop(imageArrays, [rowIndex,columnIndex,50,50]);
        [result,score] = predict(classifier, pic);
        if result-7
            plot(rowIndex, columnIndex, rowIndex+50, columnIndex, rowIndex+50, columnIndex+50, rowIndex, columnIndex+50, rowIndex, columnIndex);
            disp('YES');
        end
    end
end
disp('50');
for rowIndex = 1:30:(1920-75)
    for columnIndex = 1:30:(1080-75)
        pic = imcrop(imageArrays, [rowIndex,columnIndex,75,75]);
        [result,score] = predict(classifier, pic);
        if result-7
            disp('YES');
            plot(rowIndex, columnIndex, rowIndex+75, columnIndex, rowIndex+75, columnIndex+75, rowIndex, columnIndex+75, rowIndex, columnIndex);
        end
    end
end
disp('75');
for rowIndex = 1:30:(1920-100)
    for columnIndex = 1:30:(1080-100)
        pic = imcrop(imageArrays, [rowIndex,columnIndex,100,100]);
        [result,score] = predict(classifier, pic);
        
        if result-7
            plot(rowIndex, columnIndex, rowIndex+100, columnIndex, rowIndex+100, columnIndex+100, rowIndex, columnIndex+100, rowIndex, columnIndex);
            disp('YES');
        end
    end
end
hold off;