function bt11_labelLeaves(handles)
    
h = handles.axes1;
% setappdata(h, 'status', 'leaf');
f = gca;
hold on
bw = roipoly;

currentImage = getappdata(h, 'currentImage');
% bw = roipoly(currentImage);

if isappdata(h, 'leafLabel')
    leafLabel = getappdata(h, 'leafLabel');
    leafID = getappdata(h, 'leafID');
else
    leafLabel = zeros(size(currentImage,1), size(currentImage,2));
    leafID = [];
end

% nLeaf = length(unique(leafLabel(:)));
nLeaf = length(leafID);
leafID(nLeaf+1) = nLeaf + 1;
leafLabel(bw==1) = nLeaf + 1;
setappdata(h, 'leafLabel', leafLabel);
setappdata(h, 'leafID', leafID);
showLeafLabel(handles, currentImage)


