function [IntensityList, frequencyaverage] = Main3(AudioFileName, threshold, categoryClassifier)
% Threshold should be the same as in the preprocessing function!
[S,f,t] = AudioIn(AudioFileName, threshold);

[CC, Maxlist] = Cutter(S,f,t);

[IntensityList, frequencyaverage] = ParameterFinder(AudioFileName, Maxlist, categoryClassifier, CC, S, f, t);

end