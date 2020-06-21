
function [ULR, LE, TC, SBD] = PerformanceEvaluation(esTips, gtTips, esLabels, gtLabels, totalLeaf)
% These functions are written by Xi Yin during her Ph.D at Computer Science
% and Engineering Department, Michigan State University, 2015. 
% If you have any questions, please contact Xi Yin via yinxi.whu@gmail.com

% Please cite the following paper if you use these functions. 

% Multi-Modality Imagery Database for Plant Phenotyping
% Jeffrey A Cruz*, Xi Yin*, Xiaoming Liu, Saif M Imran, Daniel D Morries,
% David M. Kramer, Jin Chen. (Cruz and Yin made euqal contribution)
% Machine Vision and Applications, October 2015. 

%==========================================================================
% This function is used to estimate leaf alignment, segmentation, and
% tracking performance. 

% esTips: a M*N cell matrix containing estimated tip locations, where M is
% the number of plant videos, N is the number of frames for each video.
% Each cell is a K*4 matrix where K is the number of leaves, 0 indicates a
% invisible leaf. 
% gtTips: a M*N cell matrix containing ground truth tip locations. 
% esLabels: a M*N cell matrix containing estimate leaf segmentation result.
% Each cell is an image segmentation mask.
% gtLabels: a M*N cell matrix containing grouhd truth leaf segmentation. 
% totalLeaf is the total number of labelled leaves in gtLabels and gtTips. 
%==========================================================================


% check if alignment error is needed for evaluation
if exist('esTips')
    align = 1;
else
    align = 0;
end

% check if segmentation error is needed for evaluation
if exist('esLabels')
    seg = 1;
else
    seg = 0;
end

[nPlant, nFrame] = size(gtLabels);

threshold = 0.05 : 0.01 : 1.00;
nTest = length(threshold);
ULR = nan(nTest, 1);
LE = nan(nTest, 1);
TC = nan(nTest, 1);
if align
    unMatchLeaf = 0;
    unTrackLeaf = 0;
    error1 = [];
    error2 = [];    
    for pt = 1 : nPlant
        TPs = esTips(pt, :);
        GTs = gtTips(pt, :);
        [f, e1, d, e2, ~] = IDAssignForTracking(TPs, GTs);

        unMatchLeaf = unMatchLeaf + f;
        unTrackLeaf = unTrackLeaf + d;
        error1 = [error1; e1];
        error2 = [error2; e2];
    end
    
    for i = 1 : nTest
        thr = threshold(i);
        ULR(i) = (unMatchLeaf + length(find(error1>thr)))/totalLeaf;
        LE(i) = mean(error1(error1<=thr));
        TC(i) = (length(find(error2<=thr)))/totalLeaf;
    end
    
    figure(1)
    subplot(1,3,1)
    plot(threshold, ULR)
    xlabel('$\tau$','Interpreter','LaTex')
    ylabel('\it{ULR}','Interpreter','LaTex')
    grid on
    subplot(1,3,2)
    plot(threshold, LE)
    xlabel('$\tau$','Interpreter','LaTex')
    ylabel('\it{LE}','Interpreter','LaTex')
    grid on
    subplot(1,3,3)
    plot(threshold, TC)
    xlabel('$\tau$','Interpreter','LaTex')
    ylabel('\it{TC}','Interpreter','LaTex')
    grid on
end


SBD = nan;
if seg
    Dice = zeros(nPlant, nFrame);
    for pt = 1 : nPlant
        for f = 1 : nFrame
            esLabel = esLabels{pt,f};
            gtLabel = gtLabels{pt,f};
            s1 = BestDice(esLabel, gtLabel);
            s2 = BestDice(gtLabel, esLabel);
            Dice(pt,f) = min(s1,s2);
        end
        disp(pt)
    end
    SBD = mean(Dice(:));
end






