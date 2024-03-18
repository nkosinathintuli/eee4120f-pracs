## Copyright (C) 2024 Nkosinathi
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} mycorr (@var{x}, @var{y})
##
## @seealso{}
## @end deftypefn

## Author: Nkosinathi <martin@void>
## Created: 2024-02-23

1; 
function retval = mycorr (x, y)
  n = length(x); ## n is the sample size
  
  sum_x = mysum(x); 
  sum_y = mysum(y);
  sum_xy = mysum(x.*y);
  sum_x2 = mysum(x.^2);
  sum_y2 = mysum(y.^2);
  
  r = n*sum_xy - sum_x*sum_y;
  r=r/sqrt((n*sum_x2 - (sum_x)**2)*(n*sum_y2 - (sum_y)**2));
  retval = r;
endfunction

function  retval = mysum(a)
  s=0; ## sum variable
  for i=1:length(a)
    s=s+a(i);
  endfor
  retval = s;
endfunction
