function [IntensityList, frequencyaverage] = ParameterFinder(AudioFileName, Maxlist, categoryClassifier, CC , S, f, t)
IntensityList = [];
frequencyaverage = [];
for i = 1:length(Maxlist)
    
    Coordinates = Maxlist(i,:);
    ymin = Coordinates(1)-10;
    ymax = Coordinates(2)+10;
    xmin = Coordinates(3)-10;
    xmax = Coordinates(4)+10;
    
    % Make sure we don't have indices outside of S
    if ymin < 1
        ymin = 1;
    end
    if ymax > size(S,1)
        ymax = size(S,1);
    end
    if xmin < 1 
        xmin = 1;
    end
    if xmax > size(S,2)
        xmax = size(S,2);
    end
     
    ImageAreaS = S(ymin:ymax,xmin:xmax);
    ImageAreaf = transpose(f(ymin:ymax));
    ImageAreat = t(xmin:xmax);
    
    % Creating the surf plot
    surf(ImageAreat, ImageAreaf, ImageAreaS);
    shading interp;
    axis tight;
    view(0, 90);
    
    % Saving the file as an image
    ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
    Filename = "./Images\" + AudioFileName + ProperDate + ".png"; 
    saveas(gcf, Filename)
    
    % Reading the image and letting the algorithm determine whether it is
    % a meteor or not
    img = imread(Filename);
    A = predict(categoryClassifier,img);
    A(1);
    
    if A(1) == "Meteors"
        % Finding a list of intensities of the object if it is in fact a
        % meteor as determined by the algorithm
        indexesS = CC.PixelIdxList(i);
        indexesS = indexesS{1};
        IntensityList(i,:) = S(indexesS);
        % Below we have to decide what we will do in the end with the
        % intensitylist that we get as output (Take average, take min,
        % etc...)
        
        
        % Finding a list of frequencies
        
        frequencyaverage(i) = round(mean(f(ymin:ymax)));
    end
    
end
end