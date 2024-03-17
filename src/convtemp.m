%% MIT License
%% 
%% Copyright (c) 2024 Joshua Call
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function convertedValues = convtemp(valuesToConvert,inputTemperatureUnits,outputTemperatureUnits)
% convert temperature units
  
  % if input and output units are the same, return without running the rest of the function
  if strcmp(inputTemperatureUnits,outputTemperatureUnits)
    convertedValues = valuesToConvert;
    return;
  end

  % first, convert the input to Celsius
  if strcmp(inputTemperatureUnits,'K')
    valuesToConvert = valuesToConvert - 273.15;
  elseif strcmp(inputTemperatureUnits,'F')
    valuesToConvert = (valuesToConvert - 32)*5/9;
  elseif strcmp(inputTemperatureUnits,'R')
    valuesToConvert = (valuesToConvert - 491.67)*5/9;
  % if inputTemperatureUnits is not valid, throw error
  elseif ~strcmp(inputTemperatureUnits,'C')
    error("argument to convtemp inputTemperatureUnits is not valid, see documentation")
  end

  % next, convert the Celsius value to the output units
  if strcmp(outputTemperatureUnits,'K')
    valuesToConvert = valuesToConvert + 273.15;
  elseif strcmp(outputTemperatureUnits,'F')
    valuesToConvert = valuesToConvert*9/5+32;
  elseif strcmp(outputTemperatureUnits,'R')
    valuesToConvert = (valuesToConvert+273.15)*9/5;
  % if outputTemperatureUnits is not valid, throw error
  elseif ~strcmp(outputTemperatureUnits,'C')
    error("argument to convtemp outputTemperatureUnits is not valid, see documentation")
  end

  convertedValues = valuesToConvert;
end

%!assert (abs(convtemp([0 100 -40],'C','F') - [32 212 -40]) < 0.00001)
%!error convtemp([0 0 0], 'X', 'C')
%!error convtemp([0 0 0], 'C', 'X')
%!error convtemp([0 0 0], 'L', 'X')
%!assert (abs(convtemp([0 0 0],'C',"C") - [0 0 0]) < 0.00001)
%!assert (abs(convtemp([0 0 0],'F',"F") - [0 0 0]) < 0.00001)
%!assert (abs(convtemp(0,"K","C") - -273.15) < 0.00001)
%!assert (abs(convtemp([0 32 1000],'F','C') - [-17.7778 0 537.778]) < 0.001)
%!assert (abs(convtemp([0 212],'F',"F") - [0 212]) < 0.00001)
%!assert (abs(convtemp([0 250 0],'R',"C") - [-273.15 -134.261 -273.15]) < 0.001)
%!assert (abs(convtemp([0 0 0 0],'C',"R") - [491.67 491.67 491.67 491.67]) < 0.001)
%!assert (abs(convtemp([0; 273.15; 373.15],"K",'C') - [-273.15; 0; 100]) < 0.00001)
