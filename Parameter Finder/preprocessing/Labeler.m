function [] = Labeler(Maxlist, S, f, t)

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
    
    surf(ImageAreat, ImageAreaf, ImageAreaS)
    shading interp
    axis tight
    view(0, 90)
    Progress = (i/length(Maxlist))*100;
    if Progress < 20
        display("You are currently at " + string(Progress) + "%, you are still fucked")
    elseif Progress < 40
        display("You are currently at " + string(Progress) + "%, you are getting there")
    elseif Progress < 60
        display("You are currently at " + string(Progress) + "%, closer and closer")
    elseif Progress < 80
        display("You are currently at " + string(Progress) + "%, you are this: | | close to being a genius when it comes to seperating meteors from other objects")
    elseif Progress < 100
        display("you are currently at " + string(Progress) + ", you are basically a greek god, the meteor god")
    end
    Labels{i} = input('Type m when you see a meteor, o for some other object, and n if you do not want to save: ', 's');
    if Labels{i} == "m"
        ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
        Filename = "./LabeledImages\Meteors\Meteor" + ProperDate + ".png"; 
        saveas(gcf, Filename)
    elseif Labels{i} == "o"
        ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
        Filename = "./LabeledImages\Other\Other" + ProperDate + ".png"; 
        saveas(gcf, Filename)
    %elseif Labels{i} == "n"
    %    ProperDate = replace(replace(datestr(datetime)," ","_"),":" ,".");
    %    Filename = "./LabeledImages\Nothing\Nothing" + ProperDate + ".png"; 
    %    saveas(gcf, Filename)
    else 
        display("Not saving image")
    end
    
end