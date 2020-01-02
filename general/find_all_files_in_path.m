function [filePaths] = find_all_files_in_path(folderPath,varargin)
  % find_all_files_in_path(folderPath,'extention','.mat','verboseOutput','true')
  % 
  %     filePaths = find_all_files_in_path(PPA.batchPath, ...
  %       'extention', '.mat', ...
  %       'verboseOutput', false, ...
  %       'searchSubFolders', false);
  % name - value input pairs:
  % 'extention' - default is . i.e. all file types, can be specified to limit search for specific file type
  % 'verboseOutput' - 0/1, default is true
  % 'searchSubFolders' - 0/1, default is true

  % check for correct input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  p = inputParser;

  defaultExtention = '.mat';
  defaultVerboseOut = true;
  defaultSearchSubFolders = true;

  addRequired(p,'folderPath',@ischar);
  addParameter(p,'extention',defaultExtention,@ischar);
  addParameter(p,'verboseOutput',defaultVerboseOut,@islogical);
  addParameter(p,'searchSubFolders',defaultSearchSubFolders,@islogical);
  parse(p,folderPath,varargin{:});

  findExtention = p.Results.extention;
  verboseOutput = p.Results.verboseOutput;
  searchSubFolders = p.Results.searchSubFolders;

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  hor_div();
  jprintf('Finding files in folder:\n')
  fprintf('   %s...\n',folderPath)

  filePaths = []; % cell containing all found file paths
  allfilePaths = [];
  if searchSubFolders
    [~,allfilePaths] = subdir(folderPath); % get all paths to all files in this folder
    % and all it's subfolders! This can take a while if used on the wrong path!
  else
    files = struct2cell(dir(folderPath)); % files contains info on bytes etc as well, we don't care
%     allfilePaths = files(1,:); % just get file names
    % f = fullfile(filepart1,...,filepartN)
    for iFile = 1:size(files,2)
        allfilePaths{iFile} = [files{2,iFile} '\' files{1,iFile}];
    end
  end

  nFiles = numel(allfilePaths);
  fileIndex = 1;
  % remove all files with the wrong extention
  for iFile = 1:nFiles
    filePath = allfilePaths{iFile};
    [~,~,fileExtention] = fileparts(filePath);
    % check if file is mat file
    if ~strcmp(fileExtention,findExtention) || (exist(filePath,'file') == 0)
      continue; % not correct file extention, move on
    else
      filePaths{fileIndex} = fullfile(filePath);
      fileIndex = fileIndex + 1;
    end
  end


  if ~isempty(filePaths) && verboseOutput
    done(toc);
    nFiles = length(filePaths);
    fprintf('   Found the following %i files:\n',nFiles);
    fprintf('   %s\n',filePaths{:});
    hor_div();
  elseif isempty(filePaths)
    short_warn('Did not find any files in your folder. I AM SORRY!');
  else
    done(toc);
  end



end
