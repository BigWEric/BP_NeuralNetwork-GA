
%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function[Go bias] = BackPropagation( Input,Output,Go,bias,delta,forward,lay,node)   
%   This function is for achieving backpropagation feature of neural network
%   Go is a 3-dimension matrix
%m = 100; %Number of node in hidden layer
[Ir,Ic] = size(Input);
iteration=Ir;
%[Or,Oc] = size(Output);
%BatchNum = 600;
BatchSize = 1;
%V = rand(Ic,m); % Weight matrix from Input to Hidden
%W = rand(m,Oc); %Weight matrix from Hidden to Output
Tcount = 0;
%b1 = rand(1,m);
%b2 = rand(1,Oc);
%B1 =b1;%repmat(b1,100,1);
%B2 =b2%repmat(b2,100,1);
%delta_W = zeros(m,Oc);
%delta_V = zeros(Ic,m);
for iter =1:1
for BatchNum = 1:iteration

BatchIn = Input(BatchSize*(BatchNum-1)+1:BatchSize*BatchNum,:);
BatchOut = Output(BatchSize*(BatchNum-1)+1:BatchSize*BatchNum,:);
%count = 1;

[errorRate delta delta_bias Output_of_Input] = train(BatchIn,BatchOut,Go,bias,delta,forward,lay,node);

Tcount = Tcount +1;
Error_Mat(Tcount)=errorRate;%Store for display the graph
%while errorRate > 0.1 && count<2 %Treshold for converge
%count = count + 1;

Go=Go+delta;
bias=bias+delta_bias;

% W=W+delta_W;
%                 %Tweak weights based on the results of previous iteration
% V=V+delta_V;
% B1 = B1 + delta_B1; %Tweak bias
% B2 = B2 + delta_B2;

%[errorRate delta_V delta_W delta_B1 delta_B2 Output_of_OutputLayer] = train(BatchIn,BatchOut,V,W,B1,B2); % Train again
%end




 
%setting y value for plotting graph
 
end
end
Avg_Error = sum(Error_Mat)/Tcount;
Output_of_Input;
%Output_of_OutputLayer;
Avg_Error;
%y=[1:Tcount];


end

