data = [1,2,3,4,5,6,7,8,9,10];

% SPMD block
spmd
    spmdData = data;
    spmdRes = data+1;
    combineRes = gather(spmdRes);
end
disp(combineRes{1})
% GPU block
%{
gpuData = gpuArray(data);
gpuRes = gpuData+1;
cpuRes = gather(gpuRes);
%}