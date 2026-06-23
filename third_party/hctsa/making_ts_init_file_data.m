% Date created: 20260623
% Last updated: 20260623
% Notes:
%   1. 20260623: You should really follow this link: https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/calculating/input_files#input-file-format-1-.mat-file
%   It will teach you everything that you need to know.
%   2. 20260623: This script successfully produces a .mat file that is
%   understandable according to TS_Init(), which is the first step in
%   reading in time-series data in using hctsa.

% what do you want to call the datafile name:
TIMESERIES_DATA_FILENAME = 'test_datafile';
matlab_file_extension = 'm';

% just dynamically create the timeseries datafile name:
% https://stackoverflow.com/a/78351978 -> for how to do f-string-type
% formatting
TIMESERIES_DATA_FILE = sprintf('test_datafile.%s', matlab_file_extension);

% define the actual time-series data:
% I learned about randn from this page:
% https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/setup/within_matlab#example-1-compute-a-feature-vector-for-a-time-series
timeSeriesData = {randn(100,1)};

% define the label (it's really just the *name*/title) of the time-series:
labels = {'test-timeseries'};

% define the hctsa required keywords variable:
% [NOTE]: must be comma-delimited *within the string* to refer to the same
% timeseries. It's a little strange...
keywords = {'timeseries, another_word'};

% use MATLAB's save function; see the docs for the strange syntax:
% https://www.mathworks.com/help/matlab/ref/save.html

save(TIMESERIES_DATA_FILENAME,'timeSeriesData', 'labels', 'keywords');

disp('Finished creating and saving a test timeseries dataset.')
