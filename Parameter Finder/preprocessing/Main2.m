function [CC,S,Maxlist] = Main2(AudioFileName, threshold)
%% This function is used to create a labeled data set, to actually train the algorithm on this dataset run "Learn.m"
[S,f,t] = AudioIn(AudioFileName, threshold);

[CC, Maxlist] = Cutter(S,f,t);

Labeler(Maxlist, S, f, t);

end