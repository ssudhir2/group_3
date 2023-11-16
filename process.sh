#!/bin/bash                                                                                                                                                      
export LC_ALL=C
                                    
# Process one of the several partial file.* files.                                          
file=$1

# Make everything lowercase
tr '[:upper:]' '[:lower:]' < "$file" > "$file.tmp" && mv "$file.tmp" "$file"

# Remove punctuation marks and whitespaces
tr -s '[:punct:][:space:]' '\n' < "$file" > "$file.tmp" && mv "$file.tmp" "$file"

# Make everything in new line
file | grep -v '^$' < "$file" > "$file.tmp" && mv "$file.tmp" "$file"

# Sort all words
file | sort < "$file" > "$file.tmp" && mv "$file.tmp" "$file"

# Remove all entries that are not words
grep -E '^[a-zA-Z]+$' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
