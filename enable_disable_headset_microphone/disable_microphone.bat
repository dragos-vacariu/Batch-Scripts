@echo off

::Get the name of the item from the SoundVolumeView
SoundVolumeView.exe /Disable "Headset"

::Get the name of the Device from the SoundVolumeView
SoundVolumeView.exe /SetDefault "2- WI-C100" 0
SoundVolumeView.exe /SetDefault "2- WI-C100" 1
SoundVolumeView.exe /SetDefault "2- WI-C100" 2

pause
