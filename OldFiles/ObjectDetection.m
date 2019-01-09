function ObjectDetection()
he = imread('Knipsel.PNG');
he = he(:,:,2);
he(he<245) = 0;
imshow(he)
A = sum(he(:,:));
sum(A)


end

