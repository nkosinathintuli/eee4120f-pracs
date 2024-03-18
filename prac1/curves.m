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
## @deftypefn {} {@var{retval} =} curves (@var{input1}, @var{input2}, @var{input3})
##
## @seealso{}
## @end deftypefn

## Author: Nkosinathi <martin@void>
## Created: 2024-02-24

function [t,y] = curves (samples, freq, timeshift)
  fs=freq*100;
  t=(0:samples-1)/fs;
  y=sin(2*pi*freq*(t-timeshift));
endfunction
