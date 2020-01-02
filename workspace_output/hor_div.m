function hor_div(varargin)
  %% hor_div(Symbol,Width,Height) displays a horizontal line in
  % the command window, all input arguments are optional
  % hor_div(varargin) displays a horizontal line in the command window
  % examples: hor_div() -> 66 wide divider made of -
  % examples: hor_div('=') -> 66 wide divider made of =
  % examples: hor_div('=', 55) -> 55 wide divider made of =
  % examples: hor_div('=', 55,3) -> 3 lines of 55 wide divider made of =

  nVarargs = length(varargin);
  if (nVarargs == 1)
    divSymbol = varargin{1};
    divWidth = 66;
    divHeight = 1;
  elseif (nVarargs == 2)
    divSymbol = varargin{1};
    divWidth = varargin{2};
    divHeight = 1;
  elseif (nVarargs == 3)
    divSymbol = varargin{1};
    divWidth = varargin{2};
    divHeight = varargin{3};
  else
    divSymbol = '-';
    divWidth = 66;
    divHeight = 1;
  end
  disp(repmat(divSymbol,divHeight,divWidth));
end
