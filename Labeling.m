function [TestSetImages,Labels] = Labeling(CuttedSpectrums,f)

TestSetImages = {};
Labels = {};

for i = 1:length(CuttedSpectrums)
    TestSetImages{i} = CuttedSpectrums{i};
    
    
    figure(1)
    surf(1:156, f, TestSetImages{i})
    set(findobj(gcf, 'type','axes'), 'Visible','off')
    shading interp
    axis tight
    view(0, 90)
    Labels{i} = input('Type m when you see a meteor, o for some other object, and n for nothing: ', 's');
        if Labels{i} == "m"
            ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
            Filename = "./LabeledImages\Meteors\Meteor" + ProperDate + ".png"; 
            saveas(gcf, Filename)
        elseif Labels{i} == "o"
            ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
            Filename = "./LabeledImages\Other\Other" + ProperDate + ".png"; 
            saveas(gcf, Filename)
        elseif Labels{i} == "n"
            ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
            Filename = "./LabeledImages\Nothing\Nothing_" + ProperDate + ".png"; 
            saveas(gcf, Filename)
        else 
            display("Wrong input, not saving image")
        end
end
end