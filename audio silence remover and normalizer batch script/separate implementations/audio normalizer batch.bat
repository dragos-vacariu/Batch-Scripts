@echo off
setlocal enabledelayedexpansion
REM Change directory to where your MP3 files are

cd /d "C:\Users\black\Desktop\trance"

REM Create output directory if it doesn't exist
if not exist output_normalized mkdir output_normalized

for %%f in (*.mp3) do (
    echo Normalizing %%f
    
    REM Define output filename inside the output directory
    set "outfile=output_normalized\%%~nf.mp3"
    
     ffmpeg -i "%%f" -af loudnorm=I=-16:TP=-1.5:LRA=11 "!outfile!"
    
    REM IMPORTANT -- comments starting with :: can cause scripting problems
    
    REM =========================================================================
    ::I=-16 sets the target integrated loudness to -16 LUFS.
    ::TP=-1.5 sets the maximum true peak.
    ::LRA=11 controls the loudness range.
    ::Adjusting the loudness:
    ::Change the I value to control how loud the normalization should be.
    ::For example, for louder normalization, set I=-14; for softer, I=-20.
    
    ::The choice of -16 LUFS as a target loudness level is based on common industry 
    ::standards and best practices for audio loudness normalization
    REM =========================================================================
    
)
pause