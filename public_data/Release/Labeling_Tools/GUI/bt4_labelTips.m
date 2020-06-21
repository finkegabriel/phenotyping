function bt4_labelTips(h)

% setappdata(h, 'Status', 'tip');
f = gca;
hold on
[x,y,button] = ginput(1);

if isappdata(h, 'tips')
    tips = getappdata(h, 'tips');
else
    tips = [];
end
n = size(tips, 1);

while button~=27
    switch button 
        case 1
            % left button: correct tip
            n = n + 1;
            tips = [tips; x, y];
            if mod(n,2)
                p(n) = plot(x,y,'y*');
            else
                p(n) = plot(x,y,'b*');
                ln(n/2) = line(tips(n-1:n,1), tips(n-1:n, 2));
            end
        case 3
            % right button: delete tip and replace a new one
            dist = sqrt((tips(:,1)-x).^2 + (tips(:,2)-y).^2);
            [~, id] = min(dist);
            delete(p(id));
            if id==n 
                tips(n,:) = [];
                n = n - 1; % if the deleted one is the last label 
                if mod(id,2)==0
                    delete(ln(id/2))
                end
            else
                lineId = ceil(id/2);
                delete(ln(lineId));
                
                [x,y,button] = ginput(1);
                while button~=1
                    msgbox('Please label a correct tip to replace the deleted one!');
                    [x,y,button] = ginput(1);
                end

                if button==1
                    tips(id,:) = [x,y];
                    if mod(id,2)
                        p(id) = plot(x,y,'y*');
                        ln(lineId) = line(tips(id:id+1,1), tips(id:id+1, 2));
                    else
                        p(id) = plot(x,y,'b*');
                        ln(lineId) = line(tips(id-1:id,1), tips(id-1:id, 2));
                    end
                end
            end
    end
    
    [x,y,button] = ginput(1);
end
setappdata(h, 'tips', tips);


