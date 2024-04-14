clc;
clear;
warning('off');



LB = [0.01 6 10 14 -5.49 -2 0.01 0.75 1.25 1.75 2.25 -2.99 -1.5];
UB = [6 10 14 20 -2 -0.01 0.75 1.25 1.75 2.25 2.99 -1.5 -0.01];

%    {-----mfs_in------*-------mfs_out-------}
x0 = [4 8 12 16 -3 -1.5 0.5 1 1.5 2 2.5 -2 -1];

options = gaoptimset('InitialPopulation',x0,'Generation',30,'PopulationSize',40,'Display','iter');

x = ga(@flc_cost,13,[],[],[],[],LB,UB,[],options);
