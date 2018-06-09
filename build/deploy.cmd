call npm install
call npm run build

call cd %DEPLOYMENT_TARGET%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

XCOPY /d %DEPLOYMENT_SOURCE%\dist*\ %DEPLOYMENT_TARGET%\dist /s /i
XCOPY /d %DEPLOYMENT_SOURCE%\index.html %DEPLOYMENT_TARGET%\index.html*
XCOPY /d %DEPLOYMENT_SOURCE%\server.js %DEPLOYMENT_TARGET%\server.js*
XCOPY /d %DEPLOYMENT_SOURCE%\package.json %DEPLOYMENT_TARGET%\package.json*
XCOPY /d %DEPLOYMENT_SOURCE%\build\web.config %DEPLOYMENT_TARGET%\web.config*

call npm install --only=production
echo Deployed.
