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

function ecef = lla2ecef(lla,f,Re)
% Convert geodetic to ECEF

% initialize ecef to empty matrix so that it can be concatenated later
ecef = [];
% if Re parameter was not passed in, assume standard lla2ecef function call with only 1 input
  if ~exist('Re','var')
    for i = 1:size(lla,1)
      [x,y,z] = geocent_fwd(lla(i,1), lla(i,2), lla(i,3));
      ecef = [ecef; [x,y,z]];
    end
  % else, if f and Re parameters were both passed in and are doubles, then use those values
  elseif exist('f','var') && exist('Re','var') && isa(f,'double') && isa(Re,'double')
    % calculate eccentricity from flattening according to https://en.wikipedia.org/w/index.php?title=Eccentricity_(mathematics)&oldid=1204283637#Other_formulae_for_the_eccentricity_of_an_ellipse
    e = sqrt(1-(1-f)^2);
    joshua_call_copyright_ellipsoid = [Re e];
    for i = 1:size(lla,1)
      [x,y,z,~] = geocent_fwd(lla(i,1), lla(i,2), lla(i,3),joshua_call_copyright_ellipsoid);
      ecef = [ecef; [x,y,z]];
    end
  end
end
