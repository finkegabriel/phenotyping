function bt12_clearLeafLabel(handles)

h = handles.axes1;
currentImage = getappdata(h, 'currentImage');

if isappdata(h, 'leafLabel')
    leafLabel = getappdata(h, 'leafLabel');
    leafID = getappdata(h, 'leafID');
    nLeaf = length(leafID);
%     nLeaf = length(unique(leafLabel(:))) - 1;
    if nLeaf > 0
        leafLabel(leafLabel==nLeaf) = 0;
%         nLeaf = nLeaf - 1;
        leafID(nLeaf) = [];
        setappdata(h, 'leafLabel', leafLabel);
        setappdata(h, 'leafID', leafID);
        showLeafLabel(handles, currentImage)
    end
end

