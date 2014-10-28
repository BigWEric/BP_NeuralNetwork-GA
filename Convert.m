%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function [rate] = Convert( pre,act )
%Convert 10 outputs into 1 number and calculate the accuracy 
[c,r]=max(pre,[],2);
r = r-1;
[k,l]=max(act,[],2);
l = l-1;
diff = r-l;
[a,b] = size(pre);
acc = length(find(diff(:)==0));

rate = acc/a;
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

