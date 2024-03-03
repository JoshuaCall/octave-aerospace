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
