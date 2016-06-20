function nameList = ebFileNameSplit(filename, fixDate)
% nameList = ebFileNameSplit(filename)
%
% Generic function for splitting a file name, with components delimited by
% *dashes*, into parts. A list is returned. This is the more generic form
% of ebEdf2Info.m (which replaces an older function from the EEG/ge_*
% library. This version is to be preferred in new code (after June 2016).
%
% If fixDate is TRUE (ie. = 1) then the last item in the list will be
% treated as an automatically assigned date by Emotiv's Testbench program
% and decoded into a more useful form; these will be added to the list as
% date and time before returning the result. By default this is not done.
%
% MDT
% 2016.06.20
% Version 0.1

    if nargin < 2
        fixDate = 0;    % By default date is unmanipulated.
    end

    nameList = strsplit(filename, '-');
    
    if fixDate 
        noEnding = regexprep(nameList{end}, '\.edf$','');
        dte      = strsplit(noEnding, '.');
        runDate  = [dte{3} '.' dte{2} '.' dte{1}];
        runTime  = [dte{4} '.' dte{5}];
        newList  = nameList(1:(end-1));
        newList{length(newList)+1} = runDate;
        newList{length(newList)+1} = runTime;
        nameList = newList;
    end
end