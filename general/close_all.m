try
    close all;
catch
end
try %#ok<*TRYNC>
  delete(findall(0)); % closes gui figures as well
catch
end
rehash path;
rehash;
