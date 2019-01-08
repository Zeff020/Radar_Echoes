function [TestSetImages,Labels] = Main(AudioFileName)

%% This function is used to turn the audio file into spectrograms and collect some more data on the audio
[S,f,t,hop,fs] = AudioInput(AudioFileName);

%% This function is used to cut the file into smaller pieces (hardcoded at five seconds for now, may need to be smaller)
[CuttedSpectrums] = SpectrumCutter(S,f,t,hop,fs);

%% This function is used to manually label the image, determining whether they contain meteorites or not
[TestSetImages,Labels] = Labeling(CuttedSpectrums,f);

end