function showLeafCenter(handles)

h = handles.axes1;

axes(handles.axes1)
hold on
if isappdata(h, 'leafCenter')
    leafCenter = getappdata(h, 'leafCenter');
    for i = 1 : size(leafCenter,1)
        text(leafCenter(i,2), leafCenter(i,1), num2str(i))
    end
end