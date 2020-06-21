function bt1_openImage(handles, h)

[filename, pathname] = uigetfile({'*.png';'*.jpg';'*.*'},'Open an Image');
img = imread([pathname, filename]);
axes(handles.axes1)
imshow(img,[])
set(handles.edit1, 'string', filename)

mkdir([pathname, 'label'])

load([pathname, 'filenames.mat'])

setappdata(h, 'pathname', pathname)
setappdata(h, 'filenames', filenames)
setappdata(h, 'currentImage', img)

nImage = numel(filenames);
for im = 1 : nImage
    if strcmp(filename, filenames{im})
        currentF = im;
    end
end
setappdata(h, 'currentFrame', currentF)




%%%%%% SUPER PIXEL VERSION
% function bt1_openImage(handles, h)
% 
% [filename, pathname] = uigetfile({'*.png';'*.jpg';'*.*'},'Open an Image');
% img = imread([pathname, filename]);
% axes(handles.axes1)
% imshow(img)
% set(handles.edit1, 'string', filename)
% 
% mkdir([pathname, 'label\'])
% 
% load([pathname, 'filenames.mat'])
% load('spsize.mat')
% 
% if strfind(pathname, 'Arabidopsis')
%     [superLabel, maskIm] = computeSuperPixel(img, spsize);
% elseif strfind(pathname, 'Bean')
%     load([pathname, 'SuperPixel/', filename(1:end-4), '.mat']);
% end
% 
% setappdata(h, 'pathname', pathname)
% setappdata(h, 'filenames', filenames)
% setappdata(h, 'superLabel', superLabel)
% setappdata(h, 'maskIm', maskIm)
% setappdata(h, 'currentImage', img)
% 
% nImage = numel(filenames);
% for im = 1 : nImage
%     if strcmp(filename, filenames{im})
%         currentF = im;
%     end
% end
% setappdata(h, 'currentFrame', currentF)
% 
% 
