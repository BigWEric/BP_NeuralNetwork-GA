%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function error = fit(x,inputnum,hiddennum,outputnum,inputn,test)
%input: x chromosome
%input: inputn training data
%input: test test data
%Train BPNN and set error as fitness for chromosome

node = zeros(1,hiddennum+1);
forward = zeros(1,hiddennum+2);
forward(1)=inputnum;
for i=1:hiddennum
    node(i) = int8(x(i));
    forward(i+1) = int8(x(i)); %%Initialize network structure.
end
lay = hiddennum+1;
node(hiddennum+1)=outputnum; 
forward(hiddennum+2)=outputnum;
[Go bias delta]=run(lay,node,forward); %Initialize Neural network
%
[error rate Go bias] = QuickTrain(inputn,test,Go,bias,delta,forward,lay,node)
temp = abs(error);
[r c] = size(test);
error=sum(temp(:))/(r*c); % Return fitness value