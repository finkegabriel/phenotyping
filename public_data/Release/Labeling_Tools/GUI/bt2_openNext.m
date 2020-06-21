function bt2_openNext(handles)
    
h = handles.axes1;

pathname = getappdata(h, 'pathname');
currentF = getappdata(h, 'currentFrame');
filenames = getappdata(h, 'filenames');
nImage = numel(filenames);
if currentF < nImage
    leafLabel = getappdata(h, 'leafLabel');
    leafID = getappdata(h, 'leafID');
    clearData(h, {'tips'; 'leafLabel'; 'leafID'});
    
    if ~isempty(leafID)
        nLeaf = length(leafID);
    %     nLeaf = max(leafLabel(:));
        leafCenter = zeros(nLeaf, 2);
        for i = 1 : nLeaf
            [x,y] = find(leafLabel==i);
            leafCenter(i,:) = [mean(x), mean(y)];
        end
        setappdata(h, 'leafCenter', leafCenter)
    end
    
    img = imread([pathname, filenames{currentF+1}]);
    axes(handles.axes1)
    imshow(img,[])
    showLeafCenter(handles)
    setappdata(h, 'currentFrame', currentF+1);
    setappdata(h, 'currentImage', img);
    set(handles.edit1, 'string', filenames{currentF+1})
else
    msgbox('This is the last Image!');
end



%%%%%% SUPER PIXEL VERSION
% h = handles.axes1;
% 
% pathname = getappdata(h, 'pathname');
% currentF = getappdata(h, 'currentFrame');
% filenames = getappdata(h, 'filenames');
% nImage = numel(filenames);
% if currentF < nImage
%     clearData(h, {'tips'; 'leafLabel'});
%     img = imread([pathname, filenames{currentF+1}]);
%     axes(handles.axes1)
%     imshow(img)
%     setappdata(h, 'currentFrame', currentF+1);
%     setappdata(h, 'currentImage', img);
%     set(handles.edit1, 'string', filenames{currentF+1})
%     
%     if strfind(pathname, 'Arabidopsis')
%         load('spsize.mat')
%         [superLabel, maskIm] = computeSuperPixel(img, spsize);
%     elseif strfind(pathname, 'Bean')
%         load([pathname, 'SuperPixel/', filenames{currentF+1}(1:end-4), '.mat']);
%     end
% 
%     setappdata(h, 'superLabel', superLabel);
%     setappdata(h, 'maskIm', maskIm);
% else
%     msgbox('This is the last Image!');
% end