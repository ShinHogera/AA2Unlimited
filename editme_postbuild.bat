set DST=c:\mega\aa2mini\aau
copy /Y %1\AAUnlimitedDLL.dll %DST%\\AAUnlimitedDLL.dll > nul || exit /b 1
copy /Y %1\AAUnlimitedDLL.pdb %DST%\\AAUnlimitedDLL.pdb > nul || exit /b 1
cd AAUnlimited\Texts || exit /b 1
copy /Y *.lua %DST%\  > nul || exit /b 1
xcopy /Y /E mod %DST%\mod > nul  || exit /b 1
echo Copied package files to %DST%
