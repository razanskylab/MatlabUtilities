%[newHandle] = deep_copy_handle_class(newHandle,oldHandle)
% copies all public values from oldHandle to new Handle
% required as copies of handle classes are otherwise shallow, i.e.
% chaning one will change the other (which we often want anyways...)
%
% Johannes Rebling, (johannesrebling@gmail.com), 2018

function [byteSize] = get_handle_class_size(classHandle)

  % get meta class to get info about properties as we can't set
  % depended or constant properties
  classInfo = metaclass(classHandle);
  props = classInfo.PropertyList; % get all properties
  byteSize = 0;
  for iProp = 1:length(props)
    cpProp = props(iProp);
    % copy properties that are public, not constant and not dependend...
    if strcmp(cpProp.GetAccess,'public') && ~cpProp.Dependent
      currentProperty = classHandle.(cpProp.Name);
      s = whos('currentProperty');
      byteSize = byteSize + s.bytes;
    end
  end

end
