function bt6_clearTips(handles)
    
h = handles.axes1;

if isappdata(h, 'tips')
    rmappdata(h, 'tips')
    msgbox('Labeled tips removed!');
end

axes(handles.axes1)
hold on

% sp = get(handles.popupmenu1, 'value');
% if sp>1
%     maskIm = getappdata(h, 'maskIm');
%     imshow(maskIm{sp-1});
% else
%     currentImage = getappdata(h, 'currentImage');
%     imshow(currentImage)
% end