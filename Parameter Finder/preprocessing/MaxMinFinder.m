%find xmax and xmin using linear indexing; loop rows between xmax and xmin,
%do conditional on sum of entries - first non-zero = ymax, last non-zero =
%ymin
function [xmax, xmin, ymax, ymin] = MaxMinFinder(CC)
CC = bwconncomp(S);


end
