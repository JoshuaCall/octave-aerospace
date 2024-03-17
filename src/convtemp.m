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
  
  % first, convert the input to Celsius
  if strcmp(inputTemperatureUnits,'K')
    valuesToConvert = valuesToConvert - 273.15;
  elseif strcmp(inputTemperatureUnits,'F')
    valuesToConvert = (valuesToConvert - 32)*5/9;
  elseif strcmp(inputTemperatureUnits,'R')
    valuesToConvert = (valuesToConvert - 491.67)*5/9;
  end

  % next, convert the Celsius value to the output units
  if strcmp(outputTemperatureUnits,'K')
    valuesToConvert = valuesToConvert + 273.15;
  elseif strcmp(outputTemperatureUnits,'F')
    valuesToConvert = valuesToConvert*9/5+32;
  elseif strcmp(outputTemperatureUnits,'R')
    valuesToConvert = (valuesToConvert+273.15)*9/5;
  end

  convertedValues = valuesToConvert;
end
