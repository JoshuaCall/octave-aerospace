%% Copyright (C) 2024  Joshua Call
%% 
%% This library is free software; you can redistribute it and/or
%% modify it under the terms of the GNU Lesser General Public
%% License as published by the Free Software Foundation; either
%% version 2.1 of the License, or (at your option) any later version.
%% 
%% This library is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% Lesser General Public License for more details.
%% 
%% You should have received a copy of the GNU Lesser General Public
%% License along with this library; if not, write to the Free Software
%% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
%% USA

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
