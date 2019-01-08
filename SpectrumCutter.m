function [CuttedSpectrums] = SpectrumCutter(S,f,t,hop,fs)

CuttedSpectrums = {};
FiveSeconds = round((fs * 5)/hop);
NumberOfCuttedSpectrums = floor(length(S)/FiveSeconds);

for i = 1:NumberOfCuttedSpectrums
    CuttedSpectrums{i} = S(:,(i-1)*FiveSeconds+1:(i)*FiveSeconds);  
end
end