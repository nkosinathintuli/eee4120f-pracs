
mat=rand(100);
time_built = zeros(5);
time_seq = zeros(5);

for i = 1:1
    tic;
    seq_sorted = bubbleSortMatrix(mat);
    timeDuration = toc;
    time_seq(i)=timeDuration;
    disp('Sequential bubble sort:')
    disp(['Sort duration = ' num2str(timeDuration) ' seconds']);
    
    
    tic;
    builtin_sorted = sort(mat);
    timeDuration = toc;
    time_built(i)=timeDuration;
    disp('Builtin function sort:')
    disp(['Sort duration = ' num2str(timeDuration) ' seconds']) 
    
end
disp('Avg Sequenctial:')
disp(sum(time_seq)/5)
disp('Avg Builtin:')
disp(sum(time_built)/5)

1;
function sortedMatrix = bubbleSortMatrix(matrix)
    [r, c] = size(matrix);

    % Reshape the matrix to a vector for sorting

    vectorizedMatrix = reshape(matrix, 1, r * c);

    %spmd
        for i = 1:length(vectorizedMatrix)-1
            spmd
                for j = 1:length(vectorizedMatrix)-i
                    if vectorizedMatrix(j) > vectorizedMatrix(j+1)
                        
                        temp = vectorizedMatrix(j);
                        vectorizedMatrix(j) = vectorizedMatrix(j+1);
                        vectorizedMatrix(j+1) = temp;
                    end
                end
            end
        end
    %end
    % Reshape 
    sortedMatrix = reshape(vectorizedMatrix, r, c);
end


