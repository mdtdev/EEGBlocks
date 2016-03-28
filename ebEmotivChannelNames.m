function chanName = ebEmotivChannelNames(filename)

% chanName = ebEmotivChannelNames(filename)
%
% Returns the channel names from a CED file, in file order. Defaults to
% emotiv_local_noHeader.ced when called with no filename.
%
% MDT
% 2016.03.28

    if nargin < 1
        filename = 'emotiv_local_noHeader.ced';
    end

    [chanNum, chanName] = textread(filename, '%f%s%*[^\n]');

end