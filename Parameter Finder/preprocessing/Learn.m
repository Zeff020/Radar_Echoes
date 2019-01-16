function [categoryClassifier,confMatrix] = Learn()

%Specify location of labeled images and create datastore object
Dir = './LabeledImages';
imds = imageDatastore(Dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames');
%Create trainingset and testset
[trainingSet,testSet] = splitEachLabel(imds,0.4,'randomize');

%Generate bag of features
bag = bagOfFeatures(trainingSet);

%Create the actual classifier
categoryClassifier = trainImageCategoryClassifier(trainingSet,bag);

%Create confusion matrix
confMatrix = evaluate(categoryClassifier,testSet);
end