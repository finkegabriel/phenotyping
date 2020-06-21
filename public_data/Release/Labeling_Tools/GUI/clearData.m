function clearData(h, fields)

if nargin==1
    % remove everything
    data = getappdata(h);
    name = fieldnames(data);
    for i = 1 : numel(name)
        rmappdata(h, name{i})
    end
elseif nargin==2
    for i = 1 : numel(fields)
        if isappdata(h, fields{i})
            rmappdata(h, fields{i})
        end
    end
end

    
    
% nvar = numel(vars);
% for i = 1 : nvar
%     if isappdata(h, vars{i})
%         rmappdata(h, vars{i})
%     end
% end
