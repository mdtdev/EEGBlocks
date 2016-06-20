function [subjectName, runName, runDate, runTime] = ebEdf2Info(EDF_filename)
% [subName, runName, runDate, runTime] = function ebEdf2Info(EDF_filename)
%
% Convert standard EDF filename to useful information. Use full EDF name
% with extension as input.
%
% Based on the standard usage of the Emotiv "Testbench" program from before
% the company totally screwed working academic researchers and made
% everything into an awful web platform!  Loosely based on our GSU clinical
% study of mindfulness. Input filenames have three parts separated by
% DASHES. Viz.
%
% 1006-session2-02.11.2015.20.02.38.edf
%
% Returns: subName ('1006' in this example), that is, the subject name;
% runName ('session2'); runDate ('2015.11.02'); and runTime ('20.02'). Note
% that runDate is corrected to a more useful standard format (YYYY.MM.DD),
% and time is cut to HH.MM, losing seconds.
%
% Supercedes the older ge_edf2info.m and is less generic that
% ebFileNameSplit.m. Prefer ebFileNameSplit.m in new applications.
%
% MDT 2016.06.20
% Version 1.0

  noEnding    = regexprep(EDF_filename, '\.edf$','');
  itemList    = strsplit(noEnding, '-');
  subjectName = itemList{1};
  runName     = itemList{2};
  dateTime    = itemList{3};
  dte         = strsplit(dateTime, '.');
  runDate     = [dte{3} '.' dte{2} '.' dte{1}];
  runTime     = [dte{4} '.' dte{5}];
end
