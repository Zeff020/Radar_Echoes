function [CC] = Main2(AudioFileName, threshold)

[S,f,t] = AudioIn(AudioFileName, threshold);

[CC] = Cutter(S,f,t);

end