%% MIT License
%% 
%% Copyright (c) 2024 Joshua Call
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function is_leap_year = leapyear(year)
% Determines if input year(s) (either array or scalar) are leap years.
  if ~isnumeric(year)
    error("input to leapyear must be numeric")
  end
  year = floor(year);
  is_leap_year = (mod(year,4) == 0) & ((mod(year,100) ~= 0) | (mod(year,400) == 0));
end

%!assert (leapyear(0))
%!assert (~leapyear(1700))
%!assert (~leapyear(1800))
%!assert (~leapyear(1900))
%!assert (leapyear(1600))
%!assert (leapyear(2000))
%!assert (leapyear(2016))
%!assert (~leapyear(2015))
%!assert (~leapyear(1997))
%!assert (~leapyear(2042))
%!assert (~leapyear(2100))
%!assert (leapyear(2400))
%!assert (leapyear([2000 2005])==logical([1 0]))
%!error leapyear('a')
