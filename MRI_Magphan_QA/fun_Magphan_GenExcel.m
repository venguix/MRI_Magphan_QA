function fun_Magphan_GenExcel(dir_name,file_name,today_date,result)
% This function reads the historical Excel sheet and adds the new result to
% the sheet for long term scanner performance documentation and analysis.
%
% Input:
%   dir_name: Excel file directory
%   file_name: Excel file name
%   today_date: date of the QA test
%   result: numerical results vector (1-by-95 vector)
% Output:
%   NA
% Usage: 
%   
% HW: (search for HW)
%   
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v1 (17/02/15)
%          v2 ()(search for v2)
% History: v1
%          v2 
% Copyright: please see license.txt
% Acknowledgement: My study is funded by the Cancer Council NSW, Australia,
%                  project grant RG11-05. PhD under the University of 
%                  Newcastle and the Calvary Mater Newcastle Hospital 
%                  provides me the office and the MR scanner to work with.

%1.read Excel
wrt_sheet='Sheet1';
[~,~,raw]=xlsread([dir_name file_name],wrt_sheet);
% new_raw=cell(1,47);%also remember to change step 3
%2.define the new row index
new_row_ind=size(raw,1)+1;
%3.define range to write new result
wrt_range=['a' num2str(new_row_ind) ':' 'cq' num2str(new_row_ind)];%this line defines Excel col range
%4.add new date
result{1,1}=today_date{1,1};
% %5.add new result
% new_raw(1,2:34)=result;
%6.save new Excel to dir
xlswrite([dir_name file_name],result,wrt_sheet,wrt_range);
disp('The report has been updated under following path: ');
disp([dir_name file_name]);
end