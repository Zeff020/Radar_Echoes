function [CC, Maxlist] = Cutter(S,f,t)

CC = bwconncomp(S);
Maxlist = [];
for i = 1:length(CC.PixelIdxList)
    [ymin,ymax,xmin,xmax]= Maxifier(CC.PixelIdxList(i),S);
    C = [ymin,ymax,xmin,xmax];
    Maxlist = [Maxlist;C];
   
end
%print(Maxlist)
end
