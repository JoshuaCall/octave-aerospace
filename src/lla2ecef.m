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

function ecef = lla2ecef(lla)
% Convert geodetic to ECEF
  a = 6378137.0; % Semi-major Axis, NGA.STND.0036_1.0.0_WGS84 2014-07-08, page 3-3
  b = 6356752.3142; % Semi-minor Axis (Polar Radius of the Earth), NGA.STND.0036_1.0.0_WGS84 2014-07-08, page 3-9
  e2 = 6.694379990141e-3; % First Eccentricity Squared, NGA.STND.0036_1.0.0_WGS84 2014-07-08, page 3-9
  lat = deg2rad(lla(1));
  lon = deg2rad(lla(2));
  alt = lla(3);
  n = a/sqrt(1-e2*sin(lat)*sin(lat));
  x = (n+alt)*cos(lat)*cos(lon);
  y = (n+alt)*cos(lat)*sin(lon);
  z = ((1-e2)*n+alt)*sin(lat);
  ecef = [x,y,z];
end
