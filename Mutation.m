%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function ret=Mutation(pmutation,lenchrom,chrom,sizepop,num,maxgen,bound)
% Mutation function
% pmutation               input  : mutation probability
% lenchrom              input  : lenght of chromosome
% chrom                 input  : chromosome set
% sizepop               input  : populiation size
% bound                 input  : bound constraint for chromosome
% maxgen                input  : maximum generation
% num                   input  : current generation
% ret                   output : return

for i=1:sizepop   
    pick=rand;
    while pick==0
        pick=rand;
    end
    index=ceil(pick*sizepop);
   
    pick=rand;
    if pick>pmutation
        continue;
    end
    flag=0;
    while flag==0
        
        pick=rand;
        while pick==0      
            pick=rand;
        end
        pos=ceil(pick*sum(lenchrom));  %choose position for mutation
    
        pick=rand;   
        fg=(rand*(1-num/maxgen))^2;
        if pick>0.5 %Mutate or not
            chrom(i,pos)=chrom(i,pos)+(bound(pos,2)-chrom(i,pos))*fg; %Muation scheme
        else
            chrom(i,pos)=chrom(i,pos)-(chrom(i,pos)-bound(pos,1))*fg;
        end   
        flag=1;     
    end
end
ret=chrom;