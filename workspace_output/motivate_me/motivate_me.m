function [fullQuote,n] = motivate_me(n,showDivider)
% MOTIVATE_ME displays an "inspirational quote"
%   [fullQuote,n] = MOTIVATE_ME() returns a random quote
%   [fullQuote,n] = MOTIVATE_ME(n) returns quote number n
%   fullQuote - string containing the full quote
%   n -quote number, can be used the get the quote again usign MOTIVATE_ME(n)
%
%   Quotes can easily be added to the text file quotes.txt with every quote
%   entered as a string without line breaks (see quotes.txt file).
%
%   I use this function in my startup.m file to show a quote when Matlab starts.
%
%   EXAMPLES:
%   --------
%   motivate_me; % display quote on command line
%   motivate_me(5); % display quote one on command line:
%     Always get plenty of sleep, if you can.
%   motivate_me(5,true); % display quote, with lines above an below
%   ------------------------------------------------------------------
%     Always get plenty of sleep, if you can.
%   ------------------------------------------------------------------
%
%   Sources
%   -------------
%   I gathered inspirational quotes from the following places:
%   <a href="matlab:web('https://ibmi.slack.com/customize/loading')">Messages from your friends at Slack</a>
%   <a href="matlab:web('http://theoatmeal.com/')">The Oatmeal</a>
%   <a href="matlab:web('http://www.curatedquotes.com/inspirational-quotes/funny/')">Curated Quotes</a>
%   <a href="matlab:web('http://www.smosh.com/smosh-pit/photos/20-worst-motivational-posters')">20 Worst Motivational Posters</a>
%
%   See also STARTUP
%
% Johannes Rebling (johannesrebling@gmail.com), IBMI 2017


  textWidth = 66; % defines max length of quote and width of divider.

  fileName = 'quotes.txt'; % text file with every line being one quote
  fileID = fopen(fileName);
  % read quotes form text file, seperate the lines, keep white spaces
  quotes = textscan(fileID,'%s','delimiter','\n','whitespace','');
  quotes = quotes{:}; % "squeeze" out the actual cell array
  nQuotes = length(quotes);

  %
  if nargin == 0
    rng('shuffle');
    n = round(rand()*nQuotes); % no quote number supplied, get a rand. quote
    showDivider = false; % don't show divider per default
  elseif nargin == 1
    showDivider = false; % don't show divider per default
  elseif nargin == 2
  end

  quote = quotes{n};
  quote = strtrim(quote);

  fullQuote = quote; % return single string without linebreaks from function

  % if quote is to long to fit in one line, split it up into as many as needed.
  if length(quote) > textWidth
    % idea is to find all white spaces and replace certain white spaces
    % whith new-line chars to break up long quotes without hyphenation
    whiteSpaceIdx = strfind(quote,' ');
    nLines = floor(whiteSpaceIdx/textWidth); % find how many lines we need
    [~,whichLine] = unique(nLines);
    whichLine = whichLine(2:end); % first entry of whichLine is always 1
    whichLine = whichLine-1; % break before 66 lines are reached
    newLineIdx = whiteSpaceIdx(whichLine);

    % if quote is too long but last white space is before the textWidth
    if isempty(newLineIdx)
      newLineIdx = max(whiteSpaceIdx);
    end

    lastLine = quote(newLineIdx(end)+1:end);
    lastLineWhiteSpaceIdx = strfind(lastLine,' ');
    if isempty(lastLineWhiteSpaceIdx)
      newLineIdx = whiteSpaceIdx(end-1);
    end

    % prevent orphans, give the last word some company by breaking the line
    % one whitespace earlier
    quote(newLineIdx) = sprintf('\n');
  end

  % Set bold, if supported (R2011b+), stolen from
  % www.mathworks.com/matlabcentral/fileexchange/24093-cprintf-display-formatted-colored-text-in-the-command-window
  v = sscanf(version, '%d.', 2);
  majorVersion = v(1); %str2double(versionIdStrs{1}{1});
  minorVersion = v(2); %str2double(versionIdStrs{1}{2});
  if (majorVersion > 7 || minorVersion >= 13)
    quote = ['<strong>' quote '</strong>'];
    newLinePos = strfind(quote,'\n');
    % need to set bold for all lines seperately
    for iLine = 1:length(newLinePos)
      quote = insertAfter(quote,newLinePos(iLine),'<strong>');
      quote = insertBefore(quote,newLinePos(iLine),'<strong>');
    end
  end

  quote = [' ' quote '\n']; % add linebreak after quote for easy use with fprintf

  if showDivider % display horizontal line (----) before and after quote
    divider = sprintf([repmat('-',1,textWidth) '\n']);
    quote = [divider quote divider];
  else % display empty line before and after quote
    quote = ['\n' quote '\n'];
  end

  fprintf(quote);

end
