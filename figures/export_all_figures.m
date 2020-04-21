rehash path;

fileName = Conf.response;
exportFolder = 'C:\data_temp\';
createPDF = 1;
createJPG = 0;
createFIG = 0;
createTIFF = 0;
createPNG = 0;

saveAllFigure = 1;

resolution = '-r300'; % bigger files but pretier, good for printing/publications
resolution = '-r150'; % good compromise of size and look
% resolution = '-r80'; % quick and dirty

if saveAllFigure
	r = groot;
	figureHandles = r.Children;
else
	figureHandles = get(0,'CurrentFigure');
end
nFigures = length(figureHandles);

for iFigure = 1:numel(figureHandles)
	set(0,'CurrentFigure',figureHandles(iFigure))
	exportFileNameBase = [exportFolder fileName '_' num2str(iFigure)];
	disp(['Saving ' fileName '_' num2str(iFigure)])
	if createJPG
		exportPath = [exportFileNameBase '.jpg'];
		export_fig(exportPath,'-jpg','-a1',resolution,'-nofontswap');
	end

	if createPDF
		exportPath = [exportFolder fileName '.pdf'];
		if iFigure == 1
			export_fig(exportPath,'-pdf','-a1',resolution,'-nofontswap','-painters');
		else
			export_fig(exportPath,'-pdf','-a1',resolution,'-nofontswap','-painters','-append');
		end
	end

	if createTIFF
		exportPath = [exportFileNameBase '.tiff'];
		export_fig(exportPath,'-tiff','-a1',resolution,'-nofontswap');
	end

	if createPNG
		exportPath = [exportFileNameBase '.png'];
		export_fig(exportPath,'-png','-transparent', '-a1',resolution,'-nofontswap');
	end

	if createFIG
	  exportPath = [exportFileNameBase '.fig'];
	  savefig(exportPath);
	end


end
disp('Done!')
winopen(exportFolder);
