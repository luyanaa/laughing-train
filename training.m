imds = imageDatastore("./data/","FileExtensions",{'.jpg'},'IncludeSubfolders',true,'LabelSource','foldernames');
[trainingSet,testSet] = splitEachLabel(imds,0.1,'randomize');
bag = bagOfFeatures(trainingSet,'CustomExtractor',SIFT);
classifier = trainImageCategoryClassifier(imds,bag);
confMatrix = evaluate(classifier,testSet);
 