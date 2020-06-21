function saveData(handles)
    
h = handles.axes1;
if isappdata(h, 'leafLabel') && isappdata(h, 'tips')
    leafLabel = getappdata(h, 'leafLabel');
    filenames = getappdata(h, 'filenames');
    currentF = getappdata(h, 'currentFrame');
    pathname = getappdata(h, 'pathname');
    tips = getappdata(h, 'tips');
    leafID = getappdata(h, 'leafID');
    
    newTips = nan(length(leafID)*2, 2);
    n = 0;
    for i = 1 : length(leafID)
        if leafID(i)
            n = n + 1;
            newTips(i*2-1:i*2,:) = tips(n*2-1:n*2,:);
        end
    end
    tips = newTips;
   
    label = label2rgb(leafLabel, 'jet', 'k');
    imwrite(label, [pathname, 'label/', filenames{currentF}(1:end-4), '_label.png'])    
    save([pathname, 'label/', filenames{currentF}(1:end-4), '.mat'], 'leafLabel', 'tips')
    
elseif isappdata(h, 'leafLabel') && ~isappdata(h, 'tips')
    leafLabel = getappdata(h, 'leafLabel');
    filenames = getappdata(h, 'filenames');
    currentF = getappdata(h, 'currentFrame');
    pathname = getappdata(h, 'pathname');
    label = label2rgb(leafLabel, 'jet', 'k');
    imwrite(label, [pathname, 'label/', filenames{currentF}(1:end-4), '_label.png'])    
    save([pathname, 'label/', filenames{currentF}(1:end-4), '.mat'], 'leafLabel')
    
elseif isappdata(h, 'tips') && ~isappdata(h, 'leafLabel')
    tips = getappdata(h, 'tips');
    filenames = getappdata(h, 'filenames');
    currentF = getappdata(h, 'currentFrame');
    pathname = getappdata(h, 'pathname');
    save([pathname, 'label/', filenames{currentF}(1:end-4), '.mat'], 'tips')
end

