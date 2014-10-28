%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function [ Predicted ] = Test(input,bias,Go,lay,forward,node)

[c r] = size(input);
temptest=input;
for i=1:1:lay(1)
    
    Predicted=tanh(temptest*Go(1:forward(i),1:forward(i+1),i)+repmat(bias(i,1:node(i)),c,1));
    temptest=Predicted;
end

% hid = tanh(input*V+repmat(B1,c,1));
% 
% Predicted = tanh(hid*W+repmat(B2,c,1));

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

