
% S = 20*log10(S + 1e-6)
IntensityLIST1 = [];
IntensityLIST = [];
i = 0;
j= 0;
for i = 1:length(IntensityList)
    IntensityLIST1 = [];
    for j = 1:length(IntensityList{i})
        
        IntensityLIST1(j) = IntensityList{i}(j);
        
    end
    IntensityLIST = horzcat(IntensityLIST,IntensityLIST1);
end