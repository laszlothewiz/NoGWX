NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( 
	goto gotPrivileges 
) else ( 
	powershell "saps -filepath '%0' -verb runas" >nul 2>&1
)
exit /b 
:gotPrivileges
taskkill /IM GWX*
takeown /r /d N /f c:\windows\system32\gwx 
icacls c:\windows\system32\gwx\*.*  /c /t /deny everyone:F
icacls c:\windows\system32\gwx  /c /t /deny everyone:F
