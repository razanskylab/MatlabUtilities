function export_multi_figures(figHandles,fileName,exportFolder,whatExp)
	% whatExp = [PDF JPG FIG TIFF PNG]
	
	if ((nargin < 4) || isempty(whatExp)), whatExp = [1 1 0 0 0]; end

	createPDF = whatExp(1);
	createJPG = whatExp(2);
	createFIG = whatExp(3);
	createTIFF = whatExp(4);
	createPNG = whatExp(5);

	resolution = '-r300'; % bigger files but pretier, good for printing/publications
	% resolution = '-r150'; % good compromise of size and look
	% resolution = '-r80'; % quick and dirty


	for iFigure = 1:numel(figHandles)
		set(0,'CurrentFigure',figHandles(iFigure))
		exportFileNameBase = [exportFolder fileName '_' num2str(iFigure)];
		disp(['Exporting figure ' fileName '_' num2str(iFigure)])
		disp(figHandles(iFigure).Name);
		if createJPG
			exportPath = [exportFileNameBase '.jpg'];
			export_fig(exportPath,'-jpg','-a1',resolution,'-nofontswap');
		end

		if createPDF
			exportPath = [exportFolder fileName '.pdf'];
			if iFigure == 1
				export_fig(figHandles(iFigure),exportPath,'-pdf','-a1',resolution,'-nofontswap','-painters');
			else
				export_fig(figHandles(iFigure),exportPath,'-pdf','-a1',resolution,'-nofontswap','-painters','-append');
			end
		end

		if createTIFF
			exportPath = [exportFileNameBase '.tiff'];
			export_fig(figHandles(iFigure),exportPath,'-tiff','-a1',resolution,'-nofontswap');
		end

		if createPNG
			exportPath = [exportFileNameBase '.png'];
			export_fig(figHandles(iFigure),exportPath,'-png','-transparent', '-a1',resolution,'-nofontswap');
		end

		if createFIG
			exportPath = [exportFileNameBase '.fig'];
			savefig(exportPath);
		end

	end
	disp('Done!')
	winopen(exportFolder);
end