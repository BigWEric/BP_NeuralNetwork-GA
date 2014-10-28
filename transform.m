%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function [ output ] = transform(input) 
%generate class lable set
x=input(:,1);
[c,r] = size(input);
output=-ones(c,10);
for j=1:1:c
    a=x(j)+1;
 for i=1:1:10
    if i==a
        output(j,i)=1;
    end
 end
end
end