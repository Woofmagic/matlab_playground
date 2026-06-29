## What is `hctsa`?

MATLAB software package for analyzing time-series data. Its GitHub repository does a good job explaining what's going on, so just read that: https://github.com/benfulcher/hctsa.

## Notes:

1. Learned how to add hctsa to the MATLAB path. You need to navigate to the folder where the `setup.m` script is located using MATLAB's actual in-software terminal. This is typically where the installation folder is located. The answer is at this link: https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/setup#installing-the-hctsa-package:

> "...future use of the package can begin by opening Matlab, navigating to the *hctsa* package, and then loading the paths required by the *hctsa* package by running the `startup` script."

2. To load time-series data such that the package can actually use it, you actually need to make a file with certain variables. (Actually, there are two possibilites: either a `.mat` file or a `.txt` file. See: https://time-series-features.gitbook.io/hctsa-manual/installing-and-using-hctsa/calculating/input_files.)

3. After you have a good time-series `.mat` datafile, you need to run `TS_Init()`. This is an interactive command: it will ask you to preview the first three time-series and confirm if it looks good. *The important thing here that you are doing is creating a `HCTSA.mat` file, which will be the file where all of the `hctsa` metrics are stored.` If everything goes well, you should see something like this, though the actual numbers may vary.

```bash
Successfully initialized HCTSA.mat with N time series, 1076 master operations, and 7729 operations
```

4. After initializing the data, you should know that "...all results entries in the resulting `HCTSA.mat` are set to `NaN`..."

5. Absolutely nuts issue that we finall resolved. When we ran `TS_Compute()`, we got the error:

```
- - - - - - - Time series 1 / 1: test-timeseries - - - - - 
Warning: Calculation for time series 1 / 1 failed: 
Undefined function 'zscore' for input arguments of type 'double'. 
> In TS_Compute (line 219) In running_hctsa (line 25)
```

6. Apparently, running `which zscore` returned `'zscore' not found.`. This means that my installation of MATLAB did not contain the Add-On known as the "Statistics and Machine Learning Toolbox". So, I needed to install that Add-On. Unfortunately, that did not work due to the error: `Access Denied Unable to install because you do not have write permissions to this folder: $MATLABROOT`. It is thanks to the following resources that I figured out how to actually get the Add-On:

    - https://www.mathworks.com/matlabcentral/answers/2181039-how-do-i-resolve-the-access-denied-unable-to-install-because-you-do-not-have-write-permissions-to-t -> for understanding the error
    - https://www.mathworks.com/matlabcentral/answers/98886-how-do-i-install-matlab-and-its-toolboxes -> for adding Toolboxes and Add-Ons
    - https://www.mathworks.com/help/install/ug/add-to-existing-installation.html -> for adding Add-Ons
    - https://www.youtube.com/watch?v=W8F9ADbIFLg -> ultimately, this was the most helpful resource.

