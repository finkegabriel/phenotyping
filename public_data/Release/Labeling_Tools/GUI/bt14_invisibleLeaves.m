function bt14_invisibleLeaves(handles)
 
h = handles.axes1;
% status = getappdata(h, 'status');
% if strcmp(status, 'leaf')
    if isappdata(h, 'leafLabel')
        leafID = getappdata(h, 'leafID');
        nLeaf = length(leafID);
        leafID(nLeaf+1) = 0;
        setappdata(h, 'leafID', leafID);
    else
        currentImage = getappdata(h, 'currentImage');
        leafLabel = zeros(size(currentImage,1), size(currentImage,2));
        leafID(1) = 0;
        setappdata(h, 'leafLabel', leafLabel);
        setappdata(h, 'leafID', leafID);
    end
% elseif strcmp(status, 'tip')
%     if isappdata(h, 'tips')
%         tips = getappdata(h, 'tips');
%         leafID = getappdata(h, 'leafID');
%         nLeaf = length(leafID);
%         leafID(nLeaf+1) = 0;
%         tips = [tips; nan nan; nan nan];
%         setappdata(h, 'tips', tips);
%         setappdata(h, 'leafID', leafID);
%     else
%         tips = [nan nan; nan nan];
%         leafID(1) = 0;
%         setappdata(h, 'tips', tips);
%         setappdata(h, 'leafID', leafID);
%     end
% end
