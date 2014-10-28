%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function [error rate Go bias] = QuickTrain(train,test,Go,bias,delta,forward,lay,node)
%train training data
%test test data
%Go a collection of each layer`s weight
%bias a collection of each layer`s bias
%delta a collection of each layer`s delta
%forward a vector of nodes number in each layer 
%lay number of layers excluding input layer
%node  another vector of nodes number in each layer used for tracking  
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Input = train(:,2:end);
Input=Input./1000;
output = transform(train);

[Go bias]=BackPropagation(Input,output,Go,bias,delta,forward,lay,node);
In = test(:,2:end);
In=In./1000;
Predicted = Test(In,bias,Go,lay,forward,node);
Out = transform(test);
error = Predicted - Out;
rate = Convert(Predicted,Out);
%rate = 0;
end

