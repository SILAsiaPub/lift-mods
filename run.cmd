@echo off
set saxon9=saxon9he.jar
set projxslt=project.xslt
set var2x=variable2xslt.xslt
call :variableslist project.txt
@echo on
java -jar "%saxon9%" -o:"%projxslt%" "%var2x%" "%var2x%"
java -jar "%saxon9%" -o:"%outfile%" "%infile%" "%script%"
pause
goto :eof

:variableslist
:: Description: Handles variables list supplied in a file.
:: Required parameters:
:: list - a filename with name=value on each line of the file
set list=%~1
FOR /F "eol=[ delims== tokens=1,2" %%s IN (%list%) DO set %%s=%%t
goto :eof