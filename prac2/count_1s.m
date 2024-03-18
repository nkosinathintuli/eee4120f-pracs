X = randi([1 10], 100);

% 1. Block Distribution with spmdPlus
tic;
spmd
    % Divide the matrix into portion for each worker
    localX = getLocalPart(codistributed(X,codistributor1d(1)));
    
    localSum = sum(localX(:)==1);

    totalSum = spmdPlus(localSum);
end 
timeDuration = toc;
disp('Block Distribution:')
disp(['No of 1s = ' num2str(totalSum{1})])
disp(['Count duration = ' num2str(timeDuration) ' seconds'])


% 2. Cyclic Distribution with spmdPlus
tic
spmd
    % Each worker get a portion of the matrix cyclic 
    localX = X(spmdIndex:spmdSize:end, :);

    localSum = sum(localX(:)==1);

    totalSum = spmdPlus(localSum);
end
timeDuration = toc;
disp('Cyclic Distribution:')
disp(['No of 1s = ' num2str(totalSum{1})])
disp(['Count duration = ' num2str(timeDuration) ' seconds'])

% 3. 2D Distribution
tic
spmd
    X_size = size(X);
    blockRows = floor(X_size(1)/spmdSize);
    startRow = (spmdIndex-1)*blockRows+1;
    endRow = min(spmdIndex*blockRows, X_size(1));
    
    localX = X(startRow:endRow, :);

    localSum = sum(localX(:)==1);

    totalSum = spmdPlus(localSum);
end
timeDuration = toc;
disp('2D Distribution:')
disp(['No of 1s = ' num2str(totalSum{1})])
disp(['Count duration = ' num2str(timeDuration) ' seconds'])

% 4. Random Distribution

tic
spmd
   
    indices = randperm(length(X));
    localX = X(indices(spmdIndex:spmdSize:end), :);
    
    localSum = sum(localX(:)==1);

    totalSum = spmdPlus(localSum);
end
timeDuration = toc;
disp('Random Distribution:')
disp(['No of 1s = ' num2str(totalSum{1})])
disp(['Count duration = ' num2str(timeDuration) ' seconds'])

