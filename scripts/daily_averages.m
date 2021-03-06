%% daily_averages.m
% This script loads annual half-hourly measured data and calculates daily
% averages for all variable listed
%
% Created by JJB, 2020-10-02
%
% Revision history: 
%
%

% Load the data using importdata
A = importdata('..\data\CA-TP4_HH_201601010000_201701010000.csv');
B = importdata('..\data\variable-descriptions.csv',','); % list of variable names

% Starting at column 3 and moving through all remaining columns, calculated
% daily means. Plot it and save the figures
for i = 3:1:20 % changed to first 20 columns only.
    data_to_avg = A.data(:,i); data_to_avg(data_to_avg==-9999)=NaN;
   [davg] = jjb_time_averaging(data_to_avg, 1, 48); % calculate daily averages
   % extract variable name
   var_name = B{i,1}; tmp = strfind(var_name,','); if isempty(tmp)==1; tmp = length(var_name)+1; end
   var_name = var_name(1:tmp-1);
   % Plot in a figure; save figure;
   f = figure();
   plot(davg,'b.-'); title(var_name);
   print(['..\figures\' var_name '.png'],'-dpng');
   close(f)
end

