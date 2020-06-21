function bt5_showTips(handles)
    
h = handles.axes1;

if isappdata(h, 'button5')
    button5 = getappdata(h, 'button5');
    button5 = ~button5;
    setappdata(h, 'button5', button5);
else
    button5 = true;
    setappdata(h, 'button5', button5);
end
     
if isappdata(h, 'tips')
    if button5
        tips = getappdata(h, 'tips');
%         f = gca;
        axes(handles.axes1)
        hold on
        plot(tips(1:2:end, 1), tips(1:2:end, 2), 'y*')
        plot(tips(2:2:end, 1), tips(2:2:end, 2), 'b*')
        for i = 1 : size(tips,1)/2
            line(tips(i*2-1:i*2, 1), tips(i*2-1:i*2, 2))
        end
    end
else
        currentImage = getappdata(h, 'currentImage');
        axes(handles.axes1)
        imshow(currentImage,[])
%         axes(handles.axes1)
% %         f = gca;
%         hold on
%         sp = get(handles.popupmenu1, 'value');
%         if sp>1
%             maskIm = getappdata(h, 'maskIm');
%             imshow(maskIm{sp-1});
%         else
%             currentImage = getappdata(h, 'currentImage');
%             imshow(currentImage)
%         end
    end
end