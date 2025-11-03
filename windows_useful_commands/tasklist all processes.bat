REM command > filepath to save the log
tasklist /FI "STATUS eq running" /FO LIST > %USERPROFILE%\desktop\task_list.txt
notepad %USERPROFILE%\desktop\task_list.txt
pause