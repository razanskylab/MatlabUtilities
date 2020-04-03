classdef Path
  properties
    folder = '';
    extention = '.mat';
    name = '';
    full;
  end

  properties (Dependent = true)
  end

  methods
    function P = Path(fullPath)
      if nargin == 1
        [P.folder,P.name,P.extention] = fileparts(fullPath);
      end
    end

    function Open(P)
      winopen(P.folder);
    end

    % Use set methods with fullfile to make sure to only ever have one file separator (\)
    function P = set.name(P,name)
      P.name = fullfile(name);
    end

    function P = set.extention(P,extention)
      P.extention = fullfile(extention);
    end

    function P = set.folder(P,folder)
      P.folder = fullfile(folder);
    end

    function P = set.full(P,fullPath)
      [P.folder,P.name,P.extention] = fileparts(fullPath);
    end

    % Use get method to always have the correct full path!
    function full = get.full(P)
      full = fullfile(P.folder,[P.name,P.extention]);
    end

  end

end
