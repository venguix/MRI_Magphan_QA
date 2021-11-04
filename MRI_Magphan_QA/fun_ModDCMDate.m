function [QA_date_new]=fun_ModDCMDate(QA_date_orig,frmt)
% This function modifies the date format of the DICOM AcquisitionDate from
% YYYYMMDD to DDMMYYYY. So that Excel can format the date. Other output
% format can be applied, just need to add the format to the code body.
%
% Input:
%   QA_date_orig: YYYYMMDD format (str)
%   frmt: output date format, 'DDMMYYYY' or 'YYMMDD' or 'YYYY-MMM-DD' (str)
% Output:
%   QA_date_new: DDMMYYYY format (str)
% Usage: 
%   
% HW: (search for HW)
%   
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v1 (18/02/15)
%          v2 ()(search for v2)
% History: v1
%          v2 
% Copyright: please see license.txt
% Acknowledgement: My study is funded by the Cancer Council NSW, Australia,
%                  project grant RG11-05. PhD under the University of 
%                  Newcastle and the Calvary Mater Newcastle Hospital 
%                  provides me the office and the MR scanner to work with.

%1.read individual part
dummy_YY1=QA_date_orig(1:2);%1st 2 digits
dummy_YY2=QA_date_orig(3:4);%2nd 2 digits
dummy_MM=QA_date_orig(5:6);
dummy_DD=QA_date_orig(7:8);
%2.based on format to format output
date_cell(1,:)={1,2,3,4,5,6,7,8,9,10,11,12};
date_cell(2,:)={'Jan','Feb','Mar','Apr','May','Jun',...
    'Jul','Aug','Sep','Oct','Nov','Dec'};
switch frmt
    case 'DDMMYYYY'
        QA_date_new=strcat(dummy_DD,dummy_MM,dummy_YY1,dummy_YY2);
    case 'YYMMDD'
        QA_date_new=strcat(dummy_YY2,dummy_MM,dummy_DD);
    case 'YYYY-MMM-DD'
        dummy_MMM=date_cell(2,str2double(dummy_MM));
        QA_date_new=strcat(dummy_YY1,dummy_YY2,'-',dummy_MMM,'-',dummy_DD);
end
end