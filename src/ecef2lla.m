%% MIT License
%% 
%% Copyright (c) 2024 Joshua Call
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function lla = ecef2lla(ecef,f,Re)
% Convert ECEF to geodetic
  
  
% initialize lla to empty matrix so that it can be concatenated later
lla = [];
% if Re parameter was not passed in, assume standard ecef2lla function call with only 1 input
  if ~exist('Re','var')
    for i = 1:size(ecef,1)
      [lat,lon,h] = geocent_inv(ecef(i,1), ecef(i,2), ecef(i,3));
      lla = [lla; [lat,lon,h]];
    end
  % else, if f and Re parameters were both passed in and are doubles, then use those values
  elseif exist('f','var') && exist('Re','var') && isa(f,'double') && isa(Re,'double')
    % calculate eccentricity from flattening according to https://en.wikipedia.org/w/index.php?title=Eccentricity_(mathematics)&oldid=1204283637#Other_formulae_for_the_eccentricity_of_an_ellipse
    e = sqrt(1-(1-f)^2);
    joshua_call_copyright_ellipsoid = [Re e];
    for i = 1:size(ecef,1)
      [lat,lon,h,~] = geocent_inv(ecef(i,1), ecef(i,2), ecef(i,3),joshua_call_copyright_ellipsoid);
      lla = [lla; [lat,lon,h]];
    end
  end
end
