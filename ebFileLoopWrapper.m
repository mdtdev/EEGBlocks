function ebFileLoopWrapper(filePattern, f)
% ebFileLoopWrapper(filePattern, functionHandle)
%
% Function to take a filename pattern and apply a function to each one in
% sequence.
%
% PROTOTYPE!
%
% MDT
% 2016.03.15
% Version 0.0.0

    % Use the pattern to get a list of relevant files

    fileList = dir(filePattern);
    
    if isempty(fileList)
        error('ebFileLoopWrapper: Your file name pattern produces no results. WTF?');
    end

    % Check the handle

    if ~isa(f,'function_handle')
        error('ebFileLoopWrapper: You need to pass a function HANDLE, dude.');
    end

    % For loop over the filenames

    for ii = 1:length(fileList)
        fileName = fileList(ii).name;
        f(fileName);
    end
end
