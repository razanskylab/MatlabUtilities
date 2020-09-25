function imHandle = image_yy(x,y1,imData,y2,y2Label)
  %IMAGE_YY does cool things
  % [imHandle] = IMAGE_YY(x,y1,imData,y2,y2Label) creates image with two y-axis
  % uses first x-y combo for image axis and then just sets the right
  % y lim...
  %
  % Johannes Rebling (johannesrebling@gmail.com), IBMI 2018
  yyaxis left; % left axis with normal image axis
  imHandle = imagesc(x,y1,imData);

  yyaxis right; % right axis with normal image axis
  % makes an axis from 0-1, based on bascially an empty image
  ax = gca;
  % we change this axis now to display what we want to display
  ax.YLim = [y2(1) y2(end)];
  axis ij;
  ylabel(y2Label);

  yyaxis left; % return with left axis active

end
