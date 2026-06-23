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