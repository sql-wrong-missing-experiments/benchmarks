INSTRUCTIONS FOR AUTOMATED BENCHMARKING

Requisites:
- SWI-Prolog 7.2.0

Steps:
1. Decompress DESDevel in a directory D. This directory contains another directory named "des".
2. Copy both "debug.ini" and "debug1.ini" files to directory "des".
3. Start SWI-Prolog (typically, with "swipl") in directory "des".
4. Load DES by writting the following (including the final dot): [des].
5. Write at the DES prompt: /p debug

Notes:
Depending on the random seed it might not be possible to generate a given instance. By changing this seed (or running the same benchmark again in the same session) the instance can be generated eventually.
The results are output to the log file "log.txt".
You can remove or add lines in debug.ini referring to each instance, as the following one:
/p debug1.ini 4  20 10 3 3
Instances with a low number of rows (as in this case, 20) are fast to compute while others with 50 or 100 rows take more time.
You can execute a single instance as many times as you want by prepending "/repeat Number" (without the double quotes) to a line as the the above one. For instance:
/repeat 10 /p debug1.ini 4  20 10 3 3
The file "debug1.ini" should not be modified.
Remarks in the script files start with a percent character (%).
