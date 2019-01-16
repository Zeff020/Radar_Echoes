function [CC,S, Maxlist] = Main2(AudioFileName, threshold)

[S,f,t] = AudioIn(AudioFileName, threshold);

[CC, Maxlist] = Cutter(S,f,t);

Labeler(Maxlist, S, f, t);

end