clear all; %#ok<*CLALL>
try
    close all;
catch
%     while(~isempty(get(groot,'CurrentFigure')))
%         delete(gcf);
%     end
end
try %#ok<*TRYNC>
  delete(findall(0)); % closes gui figures as well
end
clc;
rehash path;
rehash;
clean_open_connections;
