function [filePath] = check_exisiting_file(filePath,autoRename)
	% check_exisiting_file(folder,fileName,autoRename)
	% check for file at folder/fileName (inkl ending!)
	% if autoRename = true (default setting), then will rename to fileName_01
	% then it will check again if filename exists and will rename to 02 if also true
	% etc. etc.
	% autoRename = 0 then dialog will pop_up, allowing use to autoRenam, manual renamce or Cancel

	% check if there is actualy already a file
	if exist(filePath,'file') == 2
		fprintf('\n');
		short_warn('File already exists!');
		fprintf(['A file with the file path:\n%s\nalready exists!'],filePath);
	else
		% no file there, go back to calling function
		return;
	end

	% file exists already, check if we want to auto rename or open a dialog
	switch nargin
	case 2
		% nothing to do
	case 1
		autoRename = 1;
	otherwise
		error('Wrong number of input arguments')
	end

	% search for unique file path / file name
	[pathstr,name,ext] = fileparts(filePath);

	if ~autoRename % open dialog box
		choice = questdlg('File already exists! What should I do?', ...
			'File already exists!', ...
			'Auto-Rename','Manual Rename','Cancel','Auto-Rename');

		% Handle response
		switch choice
		    case 'Auto-Rename'
		      % do nothing, leave name as is, rename takes place after
		    case 'Manual Rename'
					prompt={'Enter a new file name'};
					title = 'Manual Rename';
					defaultans = {name};
					answer = inputdlg(prompt,title,[1 40],defaultans);
					[~,name] = fileparts(answer{1});
		    case 'Cancel'
					error('Function check_exisiting_file canceled!');
		end
	end

	% find unique file name
	nFile = 0;
	newName = name;
	while 1
		filePath = [pathstr,'\',newName,ext];
		if (exist(filePath,'file') == 2)
			nFile = nFile + 1;
			newName = [name '_' sprintf('%03g',nFile)];
		else
			filePath = [pathstr,'\',newName,ext];
			break; % no duplicate file, exist while loop
		end
	end

end
