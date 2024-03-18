# Student number:  NTLNKO007
# Example for saving data to a file in OCTAVE

fid = fopen ("prettytest1.txt", "w");


output_precision(2, "local");
y = [1 2 3; 4 5 6; 7 8 9]

y = cast(y,"double")
y = y*1.00
[r c] = size(y)

out = "";
for i=1:r
  out=strcat(out,"|");
  for j=1:c
    out=strcat(out,mat2str(y(i,j),3)," |");
  endfor
  out=strcat(out,"\n");
endfor

#fdisp (fid, "100 + 50/2 is ");
#fdisp (fid, 100+50/2);
fdisp(fid,out);

fclose (fid);