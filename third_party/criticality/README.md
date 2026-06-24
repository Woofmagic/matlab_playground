## What is `Criticality`?

MATLAB software package for using `hctsa` to analyze time-series data and compute various metrics about the distance to dynamical criticality. Good introduction on their README.me here: https://github.com/brendanjohnharris/Criticality/tree/v0.2.1#criticality

## Notes:

1. In the Setup section (https://github.com/brendanjohnharris/Criticality/tree/v0.2.1#setup), the useful comment is:
> A workflow begins by adding files to the Matlab path; run `startup()` in the *hctsa* directory and `add_all_subfolders()` in the *Criticality* directory.

2. Unfortunately, the first line doesn't appear to work for me:

```matlab
x = time_series_generator()
Error using time_series_generator (line 275)
Not enough inputs to determine the time parameters of integration
```

I think that the code in `time_series_generator.m` does not logically allow the possibility of running `time_series_generator()`, i.e. the function without any arguments. These are the default values for these three time parameters, and these parameters are used later in an `if-elif` block: (line 254):

```matlab
addParameter(p, 'tmax', 1000)
addParameter(p, 'numpoints', [])
addParameter(p, 'dt', [])
...
lDt = isempty(dt); lTm = isempty(tmax); lN = isempty(numpoints);

if ~lDt && ~lTm && ~lN

    if (tmax == dt .* numpoints)
        dt = tmax ./ numpoints;
        p.Results.dt = dt;
    else
        error('This combination of dt, tmax and numpoints is not consistent')
    end

elseif lDt && ~lTm && ~lN
    dt = tmax ./ numpoints;
    p.Results.dt = dt;
elseif ~lDt && lTm && ~lN
    tmax = numpoints .* dt;
    p.Results.tmax = tmax;
elseif ~lDt && ~lTm && lN
    numpoints = round(tmax ./ dt); % ceil or round?
    p.Results.numpoints = numpoints;
else
    error('Not enough inputs to determine the time parameters of integration')
end
```

That entails that the following line should run:

```matlab
x = time_series_generator('dt',0.1);
```

And it does!