%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
%Training function, use for forward, use momentum function, caculate the
%delta weight matrix, use drop out function conditional;
%return the delta weight, delta bias, errorRate and last layer value to
%BackPropagation.m;
function [errorRate delta delta_bias Output_of_Input] = train(Input,Output,Go,bias,delta,forward,lay,node)
%initialize parameters; outnode to store the layer value, 
%innode store the layer value before tanh();
delta_bias=zeros(lay(1),100);
outnode=zeros(lay(1)+1,100);
innode=zeros(lay(1),100);
Output_of_Input = Input;
outnode(1,1:25)=Output_of_Input;
%active the dropout function
if lay(1)>9
dropout=zeros(lay(1),100);%drop out
possible=0.01;%drop out possible
for j=1:1:lay(1)
    for z=1:1:node(j)
        my_rand=rand(1);
        if my_rand<possible
            dropout(j,z)=0;
        end
        if my_rand>=possible
            dropout(j,z)=1/(1-possible);
        end
    end
end
end
%forward function
for i=1:1:lay(1)
    tempW=Go(1:forward(i),1:forward(i+1),i);
    tempB=bias(i,1:node(i));   
    temp_input=Output_of_Input*tempW+tempB;
    if lay(1)>9 %add the drop out.
    temp_input=temp_input.*dropout(i,1:node(i));%drop out
    end
    innode(i,1:node(i))=temp_input;
    Output_of_Input=tanh(temp_input);  
    outnode(i+1,1:node(i))=Output_of_Input;
end
%caculate the loss funtion
difference = Output_of_Input - Output;
Loss = difference.^2;
[m n] = size(difference);
errorRate = sqrt(sum(Loss)/(n*m));
LR =0.001;%Learning rate

%based the error value back propogation and caculate the delta weight and
%delta bias;(the variable "delta" is delta weight)
%use the momentum 
%momentum coefficient is 0.0001
j=lay(1);
while(j>0)
    if j==lay(1)
        L_signal=difference;
        L_layer=outnode(j,1:forward(j))'*difference;
        %use the momentum caculate the delta weight;
        delta(1:forward(j),1:forward(j+1),j)=-LR*(L_layer-0.0001*delta(1:forward(j),1:forward(j+1),j));
        Lb_layer=difference;
        delta_bias(j,1:node(j))=-LR*Lb_layer;
    end
    if j<lay(1)
        L2_layer=outnode(j,1:forward(j))'*((sech(innode(j,1:node(j))).^2).*(L_signal*Go(1:forward(j+1),1:forward(j+2),j+1)'));       
        delta(1:forward(j),1:forward(j+1),j)=-LR*(L2_layer-0.0001*delta(1:forward(j),1:forward(j+1),j));
        L2b_layer=sech(innode(j,1:node(j))).^2.*(L_signal*Go(1:forward(j+1),1:forward(j+2),j+1)');
        delta_bias(j,1:node(j))=-LR*L2b_layer;
        L_signal=(sech(innode(j,1:node(j))).^2).*(L_signal*Go(1:forward(j+1),1:forward(j+2),j+1)');
    end
    j=j-1;
end



end

