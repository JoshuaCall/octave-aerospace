%% MIT License
%% 
%% Copyright (c) 2024 Joshua Call
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function convertedValues = convacc(valuesToConvert,inputAccelUnits,outputAccelUnits)
% convert acceleration units

  % if input and output units are the same, return without running the rest of the function
  if strcmp(inputAccelUnits,outputAccelUnits)
    convertedValues = valuesToConvert;
    return;
  end

  foot_to_meter = 0.3048;
  hour_to_second = 60*60;
  mile_to_meter = 1609.344;
  standard_gravity = 9.80665;
  inch_to_meter_joshua_call_copyright = foot_to_meter/12;
  % first, convert the input to m/s^2
  if strcmp(inputAccelUnits,'ft/s^2')
    valuesToConvert = valuesToConvert*foot_to_meter;
  elseif strcmp(inputAccelUnits,'km/s^2')
    valuesToConvert = valuesToConvert*1000;
  elseif strcmp(inputAccelUnits,'in/s^2')
    valuesToConvert = valuesToConvert*inch_to_meter_joshua_call_copyright;
  elseif strcmp(inputAccelUnits,'km/h-s')
    valuesToConvert = valuesToConvert*1000*hour_to_second;
  elseif strcmp(inputAccelUnits,'mph/s')
    valuesToConvert = valuesToConvert*mile_to_meter*hour_to_second;
  elseif strcmp(inputAccelUnits,'G''s')
    valuesToConvert = valuesToConvert*standard_gravity;
  % if inputAccelUnits is not valid, throw error
  elseif ~strcmp(inputAccelUnits,'m/s^2')
    error("argument to convacc inputAccelUnits is not valid, see documentation")
  end

  % next, convert the m/s^2 value to the output units
  if strcmp(outputAccelUnits,'ft/s^2')
    valuesToConvert = valuesToConvert/foot_to_meter;
  elseif strcmp(outputAccelUnits,'km/s^2')
    valuesToConvert = valuesToConvert/1000;
  elseif strcmp(outputAccelUnits,'in/s^2')
    valuesToConvert = valuesToConvert/inch_to_meter_joshua_call_copyright;
  elseif strcmp(outputAccelUnits,'km/h-s')
    valuesToConvert = valuesToConvert/1000/hour_to_second;
  elseif strcmp(outputAccelUnits,'mph/s')
    valuesToConvert = valuesToConvert/mile_to_meter/hour_to_second;
  elseif strcmp(outputAccelUnits,'G''s')
    valuesToConvert = valuesToConvert/standard_gravity;
  % if outputAccelUnits is not valid, throw error
  elseif ~strcmp(outputAccelUnits,'m/s^2')
    error("argument to convacc outputAccelUnits is not valid, see documentation")
  end

  convertedValues = valuesToConvert;
end

%!assert (abs(convacc([1],'m/s^2','ft/s^2') - [3.28084]) < 0.00001)
%!error convacc([0 0 0], 'X', 'm/s^2')
%!error convacc([0 0 0], 'ft/s^2', 'X')
%!error convacc([0 0 0], 'L', 'X')
%!assert (abs(convacc([0 0 0],'m/s^2',"m/s^2") - [0 0 0]) < 0.00001)
%!assert (abs(convacc([0 0 0],'ft/s^2',"ft/s^2") - [0 0 0]) < 0.00001)
%!assert (abs(convacc(1,"ft/s^2","m/s^2") - 0.304800) < 0.00001)
%!assert (abs(convacc([0 1],'m/s^2','G''s') - [0 0.101972]) < 0.0001)
%!assert (abs(convacc([0 1],'G''s',"m/s^2") - [0 9.80665]) < 0.00001)
%!assert (abs(convacc([0 1],'ft/s^2',"G's") - [0 0.0310810]) < 0.0001)
%!assert (abs(convacc([1 10 20],"km/h-s",'mph/s') - [0.6214 6.2137 12.4274]) < 0.0001)
%!assert (abs(convacc([1 10 20],'mph/s',"km/h-s") - [1.6093 16.0934 32.1869]) < 0.0001)
%!assert (abs(convacc([0; 1],"G's",'ft/s^2') - [0; 32.1740]) < 0.0001)
%!assert (abs(convacc([1 -100 2000],'in/s^2',"km/s^2") - [0.0000 -0.0025 0.0508]) < 0.0001)
%!assert (abs(convacc([1 -100 2000],'km/s^2',"in/s^2") - [0.003937007874016 -0.393700787401575 7.874015748031497]*10^7) < 0.000001)
