

% These functions are written by Xi Yin during her Ph.D at Computer Science
% and Engineering Department, Michigan State University, 2015. 
% If you have any questions, please contact Xi Yin via yinxi.whu@gmail.com

% Please cite the following paper if you use these functions. 

% Multi-Modality Imagery Database for Plant Phenotyping
% Jeffrey A Cruz*, Xi Yin*, Xiaoming Liu, Saif M Imran, Daniel D Morries,
% David M. Kramer, Jin Chen. (Cruz and Yin made euqal contribution)
% Machine Vision and Applications, October 2015. 

%==========================================================================
% Please save the results and ground truth labels in the required format 
% details can be find in the function: PerformanceEvaluation.m

% evaluate alignment, segmentation, and tracking 
[ULR, LE, TC, SBD] = PerformanceEvaluation(esTips, gtTips, esLabels, gtLabels, totalLeaf);

% evaluate alignment and tracking 
[ULR, LE, TC, ~] = PerformanceEvaluation(esTips, gtTips, ~, ~, totalLeaf);

% evaluate segmentation only
[~, ~, ~, SBD] = PerformanceEvaluation(~, ~, esLabels, gtLabels, totalLeaf);



