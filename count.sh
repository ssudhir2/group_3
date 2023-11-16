#!/bin/bash

export LC_ALL=C

# merge sort all files
sort -m file.* > merged_file

# unique counts in merged file
uniq -c merged_file > unique_merged

# Sort unique_merged file
sort -n -r -k2 unique_merged > countsOfWords

# Remove redundant files
rm -f file.*
rm -f merged_file 
rm -f unique_merged
rm -f inputFileList

# Print output
echo $(head -n 5 countsOfWords)
