function [] = FixImages()

directory = dir('BadImages');
path = ".//BadImages//";
for i = 1:size(directory,1)
    if directory(i).bytes ~= 0
        
        filename = directory(i).name;
        filename = path + filename;
        filename = char(filename);
        Image = imread(filename);
        Image = Image(50:584,115:792,:);
        image(Image)
        set(gca,'position',[0 0 1 1],'units','normalized')
        saveas(gcf, directory(i).name, 'png')
        
    end
    
end
    

end