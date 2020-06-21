function bt15_restartLabel(handles)
 
h = handles.axes1;
img = getappdata(h, 'currentImage');
clearData(h, {'tips'; 'leafLabel'; 'leafID'});

axes(handles.axes1)
imshow(img,[])
showLeafCenter(handles)
