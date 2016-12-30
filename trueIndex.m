function [numIndex] = trueIndex(match_ix, pathfile)
% returns a double of the correct index of the picture
% from the pathfile directory
    trunc = pathfile(match_ix).name; 
    trunc = strtok(trunc, '.');
    trunc = trunc(8:end);
    numIndex = str2num(trunc);
end

%EX)The char 'Picture6.png' becomes a double with value 6