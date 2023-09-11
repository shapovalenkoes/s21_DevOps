#!/bin/bash


START=$(date +%s)
n_folders=$(sudo ls -l $1 | grep -c ^d)
top_5_folders=$(sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')
n_files=$(sudo find $1 -type f | wc -l)
n_conf_files=$(sudo find $1 -type f -name "*.conf" | wc -l)
n_text_files=$(sudo find $1 -type f -name "*.txt" | wc -l)
n_exe_files=$(sudo find $1 -type f -executable | wc -l)
n_log_files=$(sudo find $1 -type f -name "*.log" | wc -l)
n_archive_files=$(sudo find $1 -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz"| wc -l)
n_links=$(sudo find $1 -type l | wc -l)
top_10_files=$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')
top_10_exe_files=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')


echo "Total number of folders (including all nested ones) = $n_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_5_folders"
echo "Total number of files = $n_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $n_conf_files"
echo "Text files = $n_text_files"
echo "Executable files = $n_exe_files"
echo "Log files (with the extension .log) = $n_log_files"
echo "Archive files = $n_archive_files"
echo "Symbolic links = $n_links"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_10_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
echo "$top_10_exe_files"
END=$(date +%s)
DIFF=$(($END - $START))
echo "Script execution time (in seconds) = $DIFF"