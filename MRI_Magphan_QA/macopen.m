function macopen(file)
% Opens a file or directory, as if executing at the Terminal
% Manu Raghavan
% August 19, 2009

if(nargin==0 || nargin>1 || ~ischar(file))
    error('Please specify at one input argument, file or directory, to be opened');
end

if(~ismac)
    if(ispc)
        error('macopen does not work on Windows, use winopen instead');
    else
        error('macopen does not work on other operating systems');
    end
end

system(['open ',file]);