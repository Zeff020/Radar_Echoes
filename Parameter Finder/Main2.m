function [CC,S] = Main2(AudioFileName, threshold)

[S,f,t] = AudioIn(AudioFileName, threshold);

[CC, Maxlist] = Cutter(S,f,t);

end