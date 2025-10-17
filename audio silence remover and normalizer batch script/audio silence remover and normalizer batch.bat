@echo off
setlocal enabledelayedexpansion

REM Change the directory here
cd /d "C:\Users\black\Desktop\trance"

REM Create output directory if it doesn't exist
if not exist "output" mkdir "output"

REM For all files in the directory - remove silence at the beginning and end of track if the threshold is > -50dB
REM Normalize volume for all files

REM for %%f in (*.mp3) do ( REM this will only iterate through the files at the given filepath. DIRECTORIES WILL BE IGNORED

for /r %%f in (*.mp3) do ( REM this will iterate through all directories at the given filepath
    echo Processing %%f

    REM Define output filename inside the output directory
    set "outfile=output\%%~nf.mp3"
    
    REM ================================================================================
    REM OLD IMPLEMENTATION
    
    REM --------------------------------------------
    REM REMOVING SILENCE AT THE BEGGINING AND END OF TRACK
    REM ffmpeg -i "%%f" -af silenceremove=stop_periods=-1:stop_threshold=-50dB:start_periods=1:start_threshold=-50dB "%outfile%"
    REM start_periods=1 and start_threshold=-50dB tell FFmpeg to remove silence at the beginning of the track.
    REM stop_periods=-1 and stop_threshold=-50dB tell it to remove silence at the end of the track.
    
    REM --------------------------------------------
    REM NORMALIZING THE VOLUME LEVELS OF ALL TRACKS
    REM ffmpeg -i "%%f" -af loudnorm=I=-16:TP=-1.5:LRA=11 "%outfile%"
    REM I=-16 sets the target integrated loudness to -16 LUFS.
    REM TP=-1.5 sets the maximum true peak.
    REM LRA=11 controls the loudness range.
    REM Adjusting the loudness:
    REM Change the I value to control how loud the normalization should be.
    REM For example, for louder normalization, set I=-14; for softer, I=-20.
    
    REM The choice of -16 LUFS as a target loudness level is based on common industry 
    REM standards and best practices for audio loudness normalization
    REM --------------------------------------------
    
    REM =================================================================================
    REM Run ffmpeg with silenceremove and loudnorm filters chained
    
    ffmpeg -i "%%f" -af "silenceremove=stop_periods=-1:stop_threshold=-50dB:start_periods=1:start_threshold=-50dB, loudnorm=I=-16:TP=-1.5:LRA=11" "!outfile!"

)

pause