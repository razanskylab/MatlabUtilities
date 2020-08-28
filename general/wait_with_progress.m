function [] = wait_with_progress(waitDuration,PBar)

  % just bar, no text
  if (nargin < 2) || isempty(PBar) 
    progressbar(0);
  % simple case where single bar and single string
  elseif ischar(PBar) 
    progressbar(PBar);
    t1 = tic;
    while (toc(t1)<waitDuration)
      progressbar(toc(t1)./waitDuration);
      pause(0.1); % don't update at inf speed
    end
    progressbar(1);
  elseif isstruct(PBar)
    nBars = length(PBar.progBarStr);
    progressbar(PBar.progBarStr{:}); % update text
    progressbar(PBar.vals{:}); % update values
    t1 = tic;
    while (toc(t1)<waitDuration)
      % here we update the value of the last bar only
      switch nBars
      case 1
        progressbar(toc(t1)./waitDuration);
      case 2
        progressbar([],toc(t1)./waitDuration);
      case 3
        progressbar([],[],toc(t1)./waitDuration);
      case 4
        progressbar([],[],[],toc(t1)./waitDuration);
      end

      pause(0.1); % don't update at inf speed
    end

    switch nBars
    case 1
      progressbar(1);
    case 2
      progressbar([],1);
    case 3
      progressbar([],[],1);
    case 4
      progressbar([],[],[],1);
    end
  end
end