function bt3_openPrevious(handles)
    
h = handles.axes1;
pathname = getappdata(h, 'pathname');
currentF = getappdata(h, 'currentFrame');
filenames = getappdata(h, 'filenames');
if currentF > 1
    clearData(h, {'tips'; 'leafLabel'; 'leafID'});
    img = imread([pathname, filenames{currentF-1}]);
    axes(handles.axes1)
    imshow(img,[])
    showLeafCenter(handles)
    setappdata(h, 'currentFrame', currentF-1);
    setappdata(h, 'currentImage', img);
    set(handles.edit1, 'string', filenames{currentF-1})
    
%     if strfind(pathname, 'Arabidopsis')
%         load('spsize.mat')
%         [superLabel, maskIm] = computeSuperPixel(img, spsize);
%     elseif strfind(pathname, 'Bean')
%         load([pathname, 'SuperPixel/', filenames{currentF-1}(1:end-4), '.mat']);
%     end
%     
%     setappdata(h, 'superLabel', superLabel);
%     setappdata(h, 'maskIm', maskIm);
else
    msgbox('This is the first Image!');
end