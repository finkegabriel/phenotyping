function bt13_clearAllLeafLabels(handles)

h = handles.axes1;
currentImage = getappdata(h, 'currentImage');
if isappdata(h, 'leafLabel')
    leafLabel = getappdata(h, 'leafLabel');
    nLeaf = length(unique(leafLabel(:))) - 1;
    if nLeaf > 0
        rmappdata(h, 'leafLabel')
        showLeafLabel(handles, currentImage)
    end
else
    showLeafLabel(handles, currentImage)
end

