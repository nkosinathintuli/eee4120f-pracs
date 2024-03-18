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
## @deftypefn {} {@var{retval} =} sine (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Nkosinathi <martin@void>
## Created: 2024-02-24


## Step 2
function part4script()
  N=[100 1000 10000]; # sample sizes
  fs=48e3;


  res_table=zeros(3*5,5);


  for i=1:3 
    sum=0;
    avg=0;
    s=5*(i-1);
    for j=1:5
      y=rand(fs*N(i),1)*2-1;
      x=rand(fs*N(i),1)*2-1;
      
      tic; corr(x,y); runtime1=toc();
      tic; mycorr(x,y); runtime2=toc();
        
      res_table(j+s,1)=N(i);
      res_table(j+s,2)=runtime1; # runtime for optimised
      res_table(j+s,3)=runtime2; # runtime for original
      res_table(j+s,4)=runtime2-runtime1; # runtime difference
      res_table(j+s,5)=runtime2/runtime1; # speed-up
      sum=sum+runtime2/runtime1;
      
    endfor
    
    avg=sum/5;
    disp(strcat("Average speedup for ",num2str(N(i)), " samples: ",num2str(avg)))
  endfor
  disp("")
  disp(res_table);
endfunction
