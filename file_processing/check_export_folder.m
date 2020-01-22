function [folderPath,folderExists] = check_export_folder(folderPath,varargin)
  % makes fairly sure folderPath exists...or at least tries ...
  % if autoCreate = 1 will create folder and always return 1
  % [folderExists] = check_export_folder(folderPath);
  % [folderExists] = check_export_folder(folderPath,'autoCreate',true)
  % [folderExists,newFolderPath] = check_export_folder(folderPath,'autoBrowse',true)
  % to simply check if folder exist, use
  % [folderExists] = check_export_folder(folderPath,'autoBrowse',false,'autoCreate',false)

  p = inputParser;
  defaultAutoCreate = true;
  defaultAutoBrowse = true;
  addRequired(p,'folderPath',@ischar);
  addParameter(p,'autoCreate',defaultAutoCreate,@mustBeNumericOrLogical);
  addParameter(p,'autoBrowse',defaultAutoBrowse,@mustBeNumericOrLogical);
  parse(p,folderPath,varargin{:});

  autoBrowse = p.Results.autoBrowse;
  autoCreate = p.Results.autoCreate;

  switch exist(folderPath,'dir')
  case 7
    % all good, path exists and is a folder
    folderExists = true;
  otherwise
    % path doesn't exists ----------------------------------------------------
    if autoCreate
      fprintf('Export folder does not exist, trying to create it...')
      try
         mkdir(folderPath);
         folderExists = true;
         fprintf('created!\n');
      catch
        fprintf('failed!\n');
        folderExists = false;
      end
    else
      folderExists = false;
    end

    if ~folderExists && autoBrowse
      fprintf('Where would you like to save instead?\n')
      folderPath = uigetdir('C:\');
      if folderPath == 0
        short_warn('User canceled path selection!');
      else
        fprintf('New export path: %s\n',folderPath);
        folderExists = true;
      end
    end
  end
end
