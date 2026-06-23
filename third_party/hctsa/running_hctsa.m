% Date created: 20260623
% Last updated: 20260623
% Notes:
%   1. 20260623:
%   https://www.mathworks.com/matlabcentral/answers/477201-section-headers-are-formatting-as-comments-how-to-get-sh-working-again
%   -> for how to use comments to essentially make "section blocks" in
%   code:
%   2. 20260623: Completely unable to get past the error `No good quality
%   labels in HCTSA.mat` after TS_Compute. So, I can't run something like
%   TS_InspectQuality('summary'). What am I doing wrong...

%% define the static variables of the script:
% hard-code the name of the datafile and its extension:
DATASERIES_FILENAME = 'test_datafile.mat';

%% load the data with hcsta:
% this is the first step in hcsta analysis:
% NOTE: this will still be interactive, i.e. you'll have to interact with
% the terminal:
TS_Init(DATASERIES_FILENAME, 'hctsa', true)

disp("Loaded the time-series data with hcsta.")

% this is not working right now...
TS_Compute(true);
