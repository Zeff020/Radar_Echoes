function [ymin,ymax,xmin,xmax] = Maxifier(PixelId, S)

xmax = max(PixelId{1}); % Maximum linear index is biggest x coordinat
xmin = min(PixelId{1}); % Minimum linear index is smallest x coordinate

[I,xmin] = ind2sub(size(S),xmin); %transforms the x linear coordinate to matrix coordinate. Don't care about I and J.
[J,xmax] = ind2sub(size(S),xmax);

S = S(:,xmin:xmax);
columns = [];
for i = 1:size(S,2)
    column = S(i,:);
    if sum(column) ~= 0
        columns(i) = i;
    end
end
columns

