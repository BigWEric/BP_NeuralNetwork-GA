%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function[Go bias delta]=run(lay,node,forward)
%initiall like below (outside) 
%lay=2;
%node=[100,10]; 
%forward=[25,100,10];
Go=zeros(100,100,lay(1));
delta=zeros(100,100,lay(1));
bias=zeros(lay(1),100);
for i=1:1:lay(1)
    bias(i,1:node(i))=rand(1,node(i));
end
i=1;

while(i<=lay(1))
   Go(1:forward(i),1:forward(i+1),i)=rand(forward(i),forward(i+1));
    i=i+1;
end
%[ rate Go bias]=QuickTrain(T1,t1,Go,bias,delta,forward,lay,node);
end


% Input = train(:,2:end);
 %output = transform(train);
% if lay(1)==2
%     [go1 go2 B1 B2]=Backpropagation(Input,output,B1,B2,go1,go2);
%     In = test(:,2:end);
%     Predicted = Test(In,B1,B2,go1,go2);
%     Out = transform(test);
%     rate = Convert(Predicted,Out);
% end
% if lay(1)==3
%     
% end
% 
% 
% [W V B1 B2]=BackPropagation(Input,output,B1,B2,W,V);
% In = test(:,2:end);
% Predicted = Test(In,B1,B2,V,W);
% Out = transform(test);
% rate = Convert(Predicted,Out);