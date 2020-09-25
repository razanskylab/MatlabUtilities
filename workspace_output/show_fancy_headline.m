function [] = show_fancy_headline(whichHeadline,Conf)
  switch nargin
  case 2
    % don't do anything
  case 1
    Conf = [];
  case 0
    whichHeadline = 2;
    Conf = [];
  otherwise
  end


  switch whichHeadline
  case 1
    % asci art created on http://patorjk.com/software/taag/
    % disp('Font Name: Star Wars')
    display_headline()
    fprintf('      __    __   _______   ______        ___      .___  ___. \n')
    fprintf('     |  |  |  | |   ____| /  __  \\      /   \\     |   \\/   | \n')
    fprintf('     |  |__|  | |  |__   |  |  |  |    /  ^  \\    |  \\  /  | \n')
    fprintf('     |   __   | |   __|  |  |  |  |   /  /_\\  \\   |  |\\/|  | \n')
    fprintf('     |  |  |  | |  |     |  `--''  |  /  _____  \\  |  |  |  | \n')
    fprintf('     |__|  |__| |__|      \\______/  /__/     \\__\\ |__|  |__| \n')

    % disp('Font Name: Rectangles')
    fprintf('    ____      _          _____         ___                     \n')
    fprintf('   |    \\ ___| |_ ___   |  _  |___ ___|  _|___ ___ ___ ___ ___ \n')
    fprintf('   |  |  | .''|  _| .''|  |   __|  _| . |  _| -_|_ -|_ -| . |  _|\n')
    fprintf('   |____/|__,|_| |__,|  |__|  |_| |___|_| |___|___|___|___|_|  \n')

    switch Conf.beam
    case {'dye'}
      display_headline('Dye Laser!',['Quality Preset: ' Conf.preset]);
    case {'green'}
      display_headline('Green Laser!',['Quality Preset: ' Conf.preset]);
    case {'legacy'}
      display_headline('Legacy - Man you are old school!',['Quality Preset: ' Conf.preset]);
    case {'both','dual','all'}
      display_headline('Dual Wavelength Magic!',['Quality Preset: ' Conf.preset]);
    case {'us'}
      display_headline('Ultrasound Pulse-Echo Data',['Quality Preset: ' Conf.preset]);
    case {'tbs'}
      display_headline('I don''t care about no modes!!',['Quality Preset: ' Conf.preset]);
    otherwise
      error(['Unknown beam option: "' Conf.beam ...
       '"! Use "dye","green","dual","legacy" or "us".'])
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case 2
    fprintf('                         _._  \n')
    fprintf('                      .-''   `\n')
    fprintf('                    __|__     \n')
    fprintf('                   /     \\    \n')
    fprintf('                   |()_()|    \n')
    fprintf('                   \\{o o}/    \n')
    fprintf('                    =\\o/=      \n')
    fprintf('                     ^ ^       \n')
    motivate_me();
  case 3
    % disp('Font Name: Rectangles')
    fprintf('    ____      _          _____         ___                     \n')
    fprintf('   |    \\ ___| |_ ___   |  _  |___ ___|  _|___ ___ ___ ___ ___ \n')
    fprintf('   |  |  | .''|  _| .''|  |   __|  _| . |  _| -_|_ -|_ -| . |  _|\n')
    fprintf('   |____/|__,|_| |__,|  |__|  |_| |___|_| |___|___|___|___|_|  \n')
    switch Conf.beam
    case {'dye'}
      display_headline('Dye Laser!',['Quality Preset: ' Conf.preset]);
    case {'green','oa','edge'}
      display_headline('Green Laser!',['Quality Preset: ' Conf.preset]);
    case {'onda'}
      display_headline('Green Laser!',['Quality Preset: ' Conf.preset]);
    case {'legacy'}
      display_headline('Legacy - Man you are old school!',['Quality Preset: ' Conf.preset]);
    case {'both','dual','all'}
      display_headline('Dual Wavelength Magic!',['Quality Preset: ' Conf.preset]);
    case {'us'}
      display_headline('Ultrasound Pulse-Echo Data',['Quality Preset: ' Conf.preset]);
    case {'tbs'}
      display_headline('I don''t care about no modes!!',['Quality Preset: ' Conf.preset]);
    otherwise
      error(['Unknown beam option: "' Conf.beam ...
       '"! Use "dye","green","dual","legacy" or "us".'])
    end
  case 4
    % HFOAM RAMP (RAw Measurement Processor)
    % http://www.network-science.de/ascii/
    % Font: rectangles   Reflection: no   Adjustment: center   Stretch: no      Width: 80	 Text: FS RAMP

    fprintf('                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
    fprintf('                  %% .--.     .    .    ..--. %%\n');
    fprintf('                  %% |   )   / \\   |\\  /||   )%%\n');
    fprintf('                  %% |--''   /___\\  | \\/ ||--'' %%\n');
    fprintf('                  %% |  \\  /     \\ |    ||    %%\n');
    fprintf('                  %% ''   `''       `''    ''''    %%\n');
    fprintf('                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    display_headline('RAw Measurement Processor');

  case 5
    % http://www.network-science.de/ascii/
    % Font: rectangles   Reflection: no   Adjustment: center   Stretch: no      Width: 80	 Text: FS RAMP
    fprintf('              _____ _____    _____ _____ _____ _____ \n')
    fprintf('             |   __|   __|  | __  |  _  |     |  _  |\n')
    fprintf('             |   __|__   |  |    -|     | | | |   __|\n')
    fprintf('             |__|  |_____|  |__|__|__|__|_|_|_|__|   ')
    display_headline('Fast-Scan RAw Measurement Processor');
  end






end
