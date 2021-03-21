# Task 1A
errcount_linebyline.sh is slower but more readable. errcount.sh is faster but less readable

Choose based on needs. If much more than 100k lines, more efficient method preferred. If logsize does not change much, ok to sacrifice speed for readability.


# Task 1B
logfiles meant for read only up to 3 months can be zipped up and stored locally in an archive folder. logs of 7 years are placed on tape. Not directly accessible but can be retrieved when requested for (Similar to AWS Glacier)

#### Lifecycle policy
daily logs: in log dir

1day - 3months: zip in archive dir

3months - 7years: place on tape storage


