function [unMatchLeaf, landMarkError1, unTrackLeaf, landMarkError2, leafID] = IDAssignForTracking(TPs, GTs)
% These functions are written by Xi Yin during her Ph.D at Computer Science
% and Engineering Department, Michigan State University, 2015. 
% If you have any questions, please contact Xi Yin via yinxi.whu@gmail.com

% Please cite the following paper if you use these functions. 

% Multi-Modality Imagery Database for Plant Phenotyping
% Jeffrey A Cruz*, Xi Yin*, Xiaoming Liu, Saif M Imran, Daniel D Morries,
% David M. Kramer, Jin Chen. (Cruz and Yin made euqal contribution)
% Machine Vision and Applications, October 2015. 

%==========================================================================
% leafID switch for tracking result
% unMatchLeaf: is the number of unmatched leaves (both miss detection and
% false alarm);
% unTrackLeaf: is the number of untracked leaves;
% landMarkError1: is a vector recording the landmark error of all matched
% leaves;
% landMarkError2: is a vector recording the landmark error of all tracked
% leaves;
% leafID: is a vector recording the leafID of all leaves in TP, where 0
% indicate an unmatched leaf;
% TPs is a cell containing the tracking result (may contain 0 elements)
% GTs is a cell containing the the ground truth (may contain 0 elements)


% calculate the number of tracked leaves and number of label leaves
nImage = numel(TPs);
n1 = zeros(nImage, 1);
n2 = zeros(nImage, 1);
for im = 1 : nImage
    n1(im) = size(TPs{im}, 1);
    n2(im) = size(GTs{im}, 1);
end
tLeaf = max(n1);
lLeaf = max(n2);

% calculate the error for matched leaveas and generate ID matrix
IDMatrix = zeros(tLeaf, lLeaf);
errorCell = cell(tLeaf, lLeaf);
unMatchLeaf = 0;
landMarkError1 = [];
for im = 1 : nImage
    TP = TPs{im};
    GT = GTs{im};
    [f, error, ID] = IDAssignForAlignment(TP, GT);
    unMatchLeaf = unMatchLeaf + f;
    landMarkError1 = [landMarkError1; error(error~=Inf)];
    
    for i = 1 : length(ID)
        if ID(i)~=0
            IDMatrix(i, ID(i)) = IDMatrix(i, ID(i)) + 1;
            errorCell{i, ID(i)} = [errorCell{i, ID(i)}; error(i)];
        end
    end
end

errorMatrix = inf(tLeaf, lLeaf);
for i = 1 : tLeaf
    for j = 1 : lLeaf
        if ~isempty(errorCell{i, j})
            errorMatrix(i, j) = mean(errorCell{i,j});
        end
    end
end


% leafID assignment by analysis error matrix
leafID = zeros(tLeaf, 1);
[error, index] = min(errorMatrix(:));
while error~=inf
    [TIndex, LIndex] = ind2sub(size(errorMatrix), index);
    errorMatrix(TIndex, :) = inf;
    errorMatrix(:, LIndex) = inf;
    leafID(TIndex) = LIndex;
    [error, index] = min(errorMatrix(:));
end


% calculate untracked leaves and landmarkerror2
landMarkError2 = [];
for i = 1 : length(leafID)
    if leafID(i)~=0
        IDMatrix(i, leafID(i)) = 0;
        landMarkError2 = [landMarkError2; errorCell{i, leafID(i)}];
    end
end

unTrackLeaf = sum((IDMatrix(:)));
    



