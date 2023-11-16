#!/bin/bash                                                                                      

export LC_ALL=C
     
# Download shakespeare.tar file                                                                  
echo "Downloading shakespeare.tar file..."
wget https://pages.stat.wisc.edu/~jgillett/DSCP/CHTC/wordCounting/shakespeare.tar

# Extract tar file                                                                              
echo "Extracting shakespeare.tar file..."
tar -xvf shakespeare.tar

# Concatenate all plays into one file                                             
echo "Concatenating shakespeare/comedies/* ..."
cat ./shakespeare/comedies/* > comedies

echo "Concatenating shakespeare/histories/* ..."
cat ./shakespeare/histories/* > histories

echo "Concatenating shakespeare/poetry/* ..."
cat ./shakespeare/poetry/* > poetry

echo "Concatenating shakespeare/tragedies/* ..."
cat ./shakespeare/tragedies/* > tragedies

echo "Concatenating shakespeare/comedies/* ..."
for file in comedies histories poetry tragedies; do
    cat $file;
    echo;
done > merged

# Splitting merged file into 5 smaller files.                                          
split -d -n 5 merged file.

# Remove redundant files                                                                    
rm -rf shakespeare
rm -f shakespeare.tar
rm -f comedies histories poetry tragedies
rm -f merged

# create inputFileList for ".sub" file's "queue file from inputFileList" line     
ls -1 file.* > inputFileList
