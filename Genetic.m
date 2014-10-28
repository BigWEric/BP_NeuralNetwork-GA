%Author: Chikai ZHANG(644368) && Chuan Qin(621715);
clc
clear
input = load('D:\Users\Eric\Desktop\MELB\Statistical\adata(1)\data\train.csv');% change to your own data here
output = transform(input); %generate class lable from training data


inputnum=25;% number of nodes in input layer
hiddennum=5;% number of hiddenlayer
outputnum=10;% number of nodes in output layer

input_train=input(1:150,:);
input_test=input(50001:50150,:);
output_train=output(1:100,:);
output_test=output(50001:50100,:);


maxgen=20;                         
sizepop=10;                        
pcross=[0.4];     %Cross rate                 
pmutation=[0.1];  %mutation rate                  

numsum=5;

lenchrom=ones(1,numsum);        
bound=[ones(numsum,1) 100*ones(numsum,1)];    

%Struct for individual
individuals=struct('fitness',zeros(sizepop,1), 'chrom',[]);
avgfitness=[];                      
bestfitness=[];                     
bestchrom=[];                       

for i=1:sizepop
   
    individuals.chrom(i,:)=Code(lenchrom,bound);    %Gene encoding
    x=individuals.chrom(i,:);
    
    a = fit(x,inputnum,hiddennum,outputnum,input_train,input_test); %Calculate fitness
    b=individuals.fitness(i,:);   
    individuals.fitness(i,:)=a;
end
fitness_final = sum(individuals.fitness,2);

[bestfitness bestindex]=min(fitness_final);%Find index of best chrom
bestchrom=individuals.chrom(bestindex,:); 
avgfitness=sum(fitness_final)/sizepop;

trace=[avgfitness bestfitness]; 
 

for i=1:maxgen
    

    individuals=Select(individuals,sizepop); %select from population generated in last iteration
    avgfitness=sum(individuals.fitness)/sizepop;

    individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop,bound);%Perform cross operation

    individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,i,maxgen,bound);%Perform mutation operation
    
   
    for j=1:sizepop
        x=individuals.chrom(j,:); 
          individuals.fitness(j,:)=fit(x,inputnum,hiddennum,outputnum,input_train,input_test);   
    end
    
 
    [newbestfitness,newbestindex]=min(sum(individuals.fitness,2)./outputnum); %Find new best chrom
    [worestfitness,worestindex]=max(sum(individuals.fitness,2)./outputnum); % Find new worst chrom
  
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:); %Update best chrom
    end
    individuals.chrom(worestindex,:)=bestchrom;
    individuals.fitness(worestindex)=bestfitness; %abandon worst chrom
    
    avgfitness=sum(individuals.fitness(:))/sizepop/outputnum;
    
    trace=[trace;avgfitness bestfitness]; 
end

 figure(1)
[r c]=size(trace);
plot([1:r]',trace(:,2),'b--');
title(['Fitness curve  ' 'Total generation =' num2str(maxgen)]);
xlabel('Generation');ylabel('Fitness');
legend('Average fitness','Average fitness');
disp('1                  1');
x=bestchrom;
for i=1:hiddennum
x(i)   %Output number of nodes for each layer 
end