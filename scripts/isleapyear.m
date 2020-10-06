function [leapflag] = isleapyear(input_yr,verbose_switch)
%%% This function checks if a given input year is a leapyear.
% Output is 1 if year is a leapyear, and 0 otherwise
% usage: [leapflag] = isleapyear(input_yr)
% Created 9 Feb, 2009 by JJB:
if nargin == 1;
    verbose_switch = 1;
else
end

if ischar(input_yr)
    input_yr = str2num(input_yr);
end

%%%%%%%%%%%%%%%%%%% Check for leap year
if mod(input_yr,400)==0
%     disp([num2str(input_yr) ' is a leap year']);
    leapflag = 1;
%     data_add = 288;
    
elseif mod(input_yr,4) ==0
%     disp([num2str(input_yr) ' is a leap year']);
    leapflag = 1;
%     data_add = 288;
    
else 
    leapflag = 0;
%     data_add = 0;


end
if verbose_switch == 1
    disp([num2str(input_yr) ' is not a leap year']);
end