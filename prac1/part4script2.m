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
## @deftypefn {} {@var{retval} =} part4script2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Nkosinathi <martin@void>
## Created: 2024-02-24

## Step 3
function part4script2()
  N=[100 1000 10000];
  f = [1 1e3 1e6]; # frequencies
  
  
 
  
  r=zeros(3,3);
  for i=1:length(1)
    for j=1:length(1)
      t_shift=0:0.01:1/f(j); # 0% -> 100%
      fs=f(j)*100;
      t=(0:N(i)-1)/fs;
      c = zeros(1,length(t_shift)); #correlations
      for k=1:length(t_shift)
        y=sin(2*pi*f(j)*t);
        x=sin(2*pi*f(j)*(t-t_shift(k)));
        c(k)=corr(y,x);
      endfor
      
      
      #r(i,j)=corr(y,x);
    endfor
  endfor
  #plot(t_shift,c)
  #xlabel('Time Shift (seconds)');
  #ylabel('Correlation');
  #title('Correlation vs Time Shift');
  #grid on;
  x=sin(2*pi*f(1)*(t-0.25));
  plot(t,x,t,y)
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('y=sin(t) vs x=sint(t-t0)');
endfunction
