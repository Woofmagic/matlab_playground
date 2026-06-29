% Date created: 20260624
% Last updated: 20260629
% Notes:
%   1. 20260624: Successfully created a time-series datafile!
%   2. 20260624: Successfully used TS_Init to initialize an HCTSA.mat file!
%   3. 20260624: `No good quality labels in HCTSA.mat` again...
%   4. 20260629: Successfully unpacked the relevant variables for TS data.
%   5. 20260629: Successfully inspected quality to obtain summary matrix.

%% naming the datafile:
% what do you want to call the datafile name:
TIMESERIES_DATA_FILENAME = 'test_datafile';
matlab_file_extension = 'mat';
TIMESERIES_DATA_FILE = sprintf('test_datafile.%s', matlab_file_extension);

%% doing the timeseries generation:
% according to line 25 of `time_series_generator.m`, the output of this
% line should be timeSeriesData. See the README.md for some discussion on
% why we had difficulties here:
% fyi: this method of "unpacking" the results of this function is
% recommended as documentation under `time_series_generator.m`:
[timeSeriesData, inputs, labels, keywords] = time_series_generator( ...
    'dt', 0.1, ...
    'cp_range', [-1, 0], ... % control parameter range:
    'etarange', [0.1, 1], ... % noise parameter range:
    'system_type', 'supercritical_pitchfork_(strogatz)');

% save the file:
save(TIMESERIES_DATA_FILE, 'timeSeriesData', 'labels', 'keywords');

disp('Finished creating and saving a test timeseries dataset.')

%% initializing the timeseries:
% load the data with hcsta:
TS_Init(TIMESERIES_DATA_FILE, 'hctsa', true)

disp("Loaded the time-series data with hcsta.")

% compute all missing values in HCTSA.mat:
% https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/calculating/running_computations
% compute all values that have never been computed before (default):
TS_Compute(false, [], [], 'missing')

disp("TS compute has finshed running...")

%% inspect the results of the TS computation:
% https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/calculating/dealing_with_errors
% "...visualize where special values and errors are occurring after a
% computation to see where things might be going wrong..."
% 'summary' is default; 'full' is exhaustive:
TS_InspectQuality('full')

disp("TS inspection as finished... check local directory for summary matrix!")