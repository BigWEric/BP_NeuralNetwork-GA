%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function ret=Code(lenchrom,bound)
%code structure parameters of BP network into chromosome

flag=0;
while flag==0
    pick=randi(100,1,length(lenchrom));
    ret=mod(pick,100); 
    flag=Genetest(lenchrom,bound,ret);
end