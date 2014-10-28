%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
function ret=select(individuals,sizepop)
% Select individual with best fitness to form new population
% individuals input    chromosome group
% sizepop     input    size
% ret         output   return


fitness1=10./individuals.fitness; %Prepare for finding best chromosome
fitness1 = sum(fitness1,2)./10;

sumfitness=sum(fitness1);
sumf=fitness1./sumfitness;


index=[]; 
for i=1:sizepop   
    pick=rand;
    while pick==0    
        pick=rand;        %Find index of best chromosome based on fitness
    end
    for j=1:sizepop    
        pick=pick-sumf(j);        
        if pick<0        
            index=[index j];            
            break;  
        end
    end
ci = individuals.chrom(i,:);
cin =individuals.chrom(index(i),:);
individuals.chrom(i,:)=cin;
individuals.fitness(i,:)=individuals.fitness(index(i),:); % Form a new individuals
    
end



ret=individuals;
