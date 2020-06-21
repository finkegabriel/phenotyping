function showLeafLabel(handles, img)

h = handles.axes1;
if isappdata(h, 'leafLabel')
    leafLabel = getappdata(h, 'leafLabel');
    leafID = getappdata(h, 'leafID');
    nLeaf = length(leafID);
%     leafID = unique(leafLabel(:));
%     nLeaf = numel(leafID)-1;

    axes(handles.axes1)
    imshow(img,[])
    hold on
    plots = {'b.', 'g.', 'c.', 'm.', 'y.', 'k.', 'w.'};
    for i = 1 : nLeaf
        if leafID(i)
            pp = plots{mod(i,7)+1};
            bw = zeros(size(leafLabel));
            bw(leafLabel==leafID(i)) = 1;

            br = bwboundaries(bw);
            plot(br{1}(:,2), br{1}(:,1), pp)
    %         e = edge(bw, 'canny');
    %         [x,y] = find(e==1);
    %         plot(y,x,pp)
        end
    end
else
    axes(handles.axes1)
    imshow(img);
end
showLeafCenter(handles)


% e = edge(leafLabel, 'canny');
% [x,y] = find(e==1);
% 
% axes(handles.axes1)
% imshow(maskim)
% hold on
% plot(y,x,'w.')
% hold off