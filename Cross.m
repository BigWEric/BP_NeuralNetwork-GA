%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function ret=Cross(pcross,lenchrom,chrom,sizepop,bound)
%Crossover function for reproduction
% pcorss                input  : Probablity of Cross
% lenchrom              input  : chromosome length
% chrom                 input  : chromosome set
% sizepop               input  : size of population
% ret                   output : return
 for i=1:sizepop  
     pick=rand(1,2); %pick 2 individuals
     while prod(pick)==0
         pick=rand(1,2);
     end
     index=ceil(pick.*sizepop);
     pick=rand;
     while pick==0
         pick=rand;
     end
     if pick>pcross % Cross or not
         continue;
     end
     flag=0;
     while flag==0
         % choose cross position
         pick=rand;
         while pick==0
             pick=rand;
         end
         pos=ceil(pick.*sum(lenchrom)); 
         pick=rand;
         p1=chrom(index(1),pos);
         p2=chrom(index(2),pos);
         chrom(index(1),pos)=pick*p2+(1-pick)*p1; %cross between 2 chromonsomes
         chrom(index(2),pos)=pick*p1+(1-pick)*p2; %reproduce 2 new chromsomes and overwrite the old two
         flag1=Genetest(lenchrom,bound,chrom(index(1),:));  %Test for constraint
         flag2=Genetest(lenchrom,bound,chrom(index(2),:));  %
         if   flag1*flag2==0
             flag=0;
         else flag=1;
         end  
     end
 end
ret=chrom;