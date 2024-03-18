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
## @deftypefn {}  part3script ()
##
## @seealso{}
## @end deftypefn

## Author: Nkosinathi <martin@void>
## Created: 2024-02-24

function part3script ()
  
  ## Step #2 
  
  whiten = createwhiten(1000); 
  size(whiten);
  
  audiowrite('white_noise_sound2.wav',whiten,'BitsPerSample', 16);

  ## Step #3
  
  fs=8e3; # sampling frequency 48kHz
  N=1000; # duration 1000s
  
  res_table=zeros(5,4);
  sum=0;
  for i=[1:5]
    tic; white = rand(fs*N, 1)*2 - 1; runtime1 = toc(); # disp(strcat("It took: ", num2str(runtime*1000), " ms to run"));
    
    tic; whiten=createwhiten(N); runtime2=toc();
    
    res_table(i,1)=runtime1; # runtime for optimised
    res_table(i,2)=runtime2; # runtime for original
    res_table(i,3)=runtime2-runtime1; # runtime difference
    res_table(i,4)=runtime2/runtime1; # speed-up
    sum=sum+runtime2/runtime1;
  endfor
  avg=sum/5; # average speed up
  disp(res_table);
  disp("")
  disp(strcat("Average speed up: ",num2str(avg)))
  
endfunction

function retval = createwhiten (N)
  fs = 8e3; ## sampling frequency 48kHz or 8kHz
  samples = fs * N;
  y = zeros(samples,1);
  
  for i=1:samples
    y(i)=rand();
  endfor
  retval = y*2-1;
endfunction