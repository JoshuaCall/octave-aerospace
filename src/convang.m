%% MIT License
%% 
%% Copyright (c) 2024 Joshua Call
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function convertedValues = convang(valuesToConvert,inputAngleUnits,outputAngleUnits)
% convert angle units

  % first, convert the input to radians
  if strcmp(inputAngleUnits,'deg')
    valuesToConvert = valuesToConvert*pi/180;
  elseif strcmp(inputAngleUnits,'rev')
    valuesToConvert = valuesToConvert*2*pi;
  % if inputAngleUnits is not valid, throw error
  elseif ~strcmp(inputAngleUnits,'rad')
    error("argument to convang inputAngleUnits is not valid, see documentation")
  end

  % next, convert the rad value to the output units
  if strcmp(outputAngleUnits,'deg')
    valuesToConvert = valuesToConvert*180/pi;
  elseif strcmp(outputAngleUnits,'rev')
    valuesToConvert = valuesToConvert/(2*pi);
  % if outputAngleUnits is not valid, throw error
  elseif ~strcmp(outputAngleUnits,'rad')
    error("argument to convang outputAngleUnits is not valid, see documentation")
  end

  convertedValues = valuesToConvert;
end

%!assert (abs(convang([0 1],'rad','deg') - [0 57.295779513082323]) < 0.0000001)
%!error convang([0 0 0], 'X', 'rad')
%!error convang([0 0 0], 'rad', 'X')
%!error convang([0 0 0], 'L', 'X')
%!assert (abs(convang([0 0 0],'rad',"rad") - [0 0 0]) < 0.00001)
%!assert (abs(convang([0 0 0],'deg',"deg") - [0 0 0]) < 0.00001)
%!assert (abs(convang(1,"deg","rad") - 0.0174533) < 0.00001)
%!assert (abs(convang([0 1],'rad','rev') - [0 0.159154943091895]) < 0.000001)
%!assert (abs(convang([0 1],'rev',"rad") - [0 6.283185307179586]) < 0.000001)
%!assert (abs(convang([0 1],'deg',"rev") - [0 0.002777777777778]) < 0.000001)
%!assert (abs(convang([0; 1],"rev",'deg') - [0; 360]) < 0.0000001)
%!assert (abs(convang([1 -100 2000],'rad',"rev") - [0.001591549430919 -0.159154943091895 3.183098861837907]*10^2) < 0.0001)
%!assert (abs(convang([1 -100 2000],'rev',"rad") - [0.000628318530718 -0.062831853071796 1.256637061435917]*10^4) < 0.000001)
