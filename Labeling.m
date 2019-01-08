function [TestSetImages,Labels] = Labeling(CuttedSpectrums,f)

TestSetImages = {};
Labels = {};

for i = 1:length(CuttedSpectrums)
    TestSetImages{i} = CuttedSpectrums{i};
    
    
    figure(1)
    surf(1:156, f, TestSetImages{i})
    shading interp
    axis tight
    view(0, 90)
    Labels{i} = input('Type m when you see a meteor, o for some other object, and n for nothing: ', 's');
end