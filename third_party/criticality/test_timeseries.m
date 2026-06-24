% Date created: 20260624
% Last updated: 20260624
% Notes:
%   1. 20260624: 
%   Successfully created a time-series datafile!
%   2. 20260624:
%   Successfully used TS_Init to initialize an HCTSA.mat file!
%   3. 20260624: `No good quality labels in HCTSA.mat` again...

% what do you want to call the datafile name:
TIMESERIES_DATA_FILENAME = 'test_datafile';
matlab_file_extension = 'm';
TIMESERIES_DATA_FILE = sprintf('test_datafile.%s', matlab_file_extension);

% according to line 25 of `time_series_generator.m`, the output of this
% line should be timeSeriesData. See the README.md for some discussion on
% why we had difficulties here:
timeSeriesData = time_series_generator( ...
    'dt', 0.1, ...
    'cp_range', [-1, 0], ...
    'etarange', [0.1, 1], ...
    'system_type', 'supercritical_pitchfork_(strogatz)');

% as required by hctsa, need to get the labels:
labels = {'test-timeseries'};

% as required by hctsa, need to get the keywords:
keywords = {'timeseries, dynamical_system, noisy_data'};

% save the file:
save(TIMESERIES_DATA_FILE, 'timeSeriesData', 'labels', 'keywords');

disp('Finished creating and saving a test timeseries dataset.')

TS_Init('test_datafile.mat', 'hctsa', true)

disp("Loaded the time-series data with hcsta.")

TS_Compute(false)

% same error... there are no good quality labels in the file...
TS_InspectQuality('summary')