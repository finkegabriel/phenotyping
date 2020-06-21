function [unMatchLeaf, landMarkError, leafID] = IDAssignForAlignment(TP, GT)
% These functions are written by Xi Yin during her Ph.D at Computer Science
% and Engineering Department, Michigan State University, 2015. 
% If you have any questions, please contact Xi Yin via yinxi.whu@gmail.com

% Please cite the following paper if you use these functions. 

% Multi-Modality Imagery Database for Plant Phenotyping
% Jeffrey A Cruz*, Xi Yin*, Xiaoming Liu, Saif M Imran, Daniel D Morries,
% David M. Kramer, Jin Chen. (Cruz and Yin made euqal contribution)
% Machine Vision and Applications, October 2015. 

%==========================================================================
% leafID switch for alignment result
% unMatchLeaf: is the number of unmatched leaf (both miss detection and
% false alarm);
% landMarkError: is a vector recording the landmark error of all matched
% leaves;
% leafID: is a vector recording the leafID of all leaves in TP, where 0
% indicate an unmatched leaf;
% TP is the alignment result (may contain 0 elements)
% GT is the ground truth (may contain 0 elements)


% delete all 0 elements in tip matrix
n1 = size(TP, 1);
dLeafID = zeros(n1, 1);
dLeaf = 0;
for i = 1 : n1
    if sum(TP(i, :)) ~= 0
        dLeaf = dLeaf + 1;
        dLeafID(dLeaf) = i;
    end
end
dLeafID = dLeafID(1:dLeaf);
TP = TP(dLeafID, :);
    
n2 = size(GT, 1);
lLeafID = zeros(n2, 1);
lLeaf = 0;
for i = 1 : n2
    if sum(GT(i, :)) ~= 0
        lLeaf = lLeaf + 1;
        lLeafID(lLeaf) = i;
    end
end
lLeafID = lLeafID(1:lLeaf);
GT = GT(lLeafID, :);

unMatchLeaf = abs(dLeaf-lLeaf);


% calculate the error matrix
errorMatrix = zeros(dLeaf, lLeaf);

for d = 1 : dLeaf
    DTip = TP(d, :);
    for l = 1 : lLeaf
        LTip = GT(l, :);
        d1 = sqrt((DTip(1)-LTip(1))^2 + (DTip(2)-LTip(2))^2);
        d2 = sqrt((DTip(3)-LTip(3))^2 + (DTip(4)-LTip(4))^2);
        leafLength = sqrt((LTip(1)-LTip(3))^2 + (LTip(2)-LTip(4))^2);
        error = (d1 + d2)/2;
        errorMatrix(d, l) = error/leafLength;
    end
end

% leafID assignment by analysis error matrix
leafID = zeros(n1, 1);
landMarkError = Inf(n1, 1);
[minDist, index] = min(errorMatrix(:));

while minDist ~= inf
    [DIndex, LIndex] = ind2sub(size(errorMatrix), index);
    errorMatrix(DIndex, :) = inf;
    errorMatrix(:, LIndex) = inf;
    landMarkError(dLeafID(DIndex)) = minDist;
    leafID(dLeafID(DIndex)) = lLeafID(LIndex);
    [minDist, index] = min(errorMatrix(:));
end



