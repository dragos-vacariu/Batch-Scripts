@echo off
setlocal enabledelayedexpansion

REM Change the directory here
cd /d "C:\Users\black\Desktop\trance"

REM Create output directory if it doesn't exist
if not exist "output_trimmed_silence" mkdir "output_trimmed_silence"

REM For all files in the directory - remove silence at the beginning and end of track if the threshold is > -50dB
for %%f in (*.mp3) do (
    echo Processing %%f

    REM Define output filename inside the output directory
    set "outfile=output_trimmed_silence\%%~nf.mp3"

    ffmpeg -i "%%f" -af silenceremove=stop_periods=-1:stop_threshold=-50dB:start_periods=1:start_threshold=-50dB "!outfile!"

    REM start_periods=1 and start_threshold=-50dB tell FFmpeg to remove silence at the beginning of the track.
    REM stop_periods=-1 and stop_threshold=-50dB tell it to remove silence at the end of the track.
)
pause