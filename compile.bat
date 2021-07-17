@ECHO OFF
IF NOT EXIST "javacc\" (
    ECHO Please extract javac v7 to a directory named javacc
    EXIT /B 1
)

IF NOT EXIST "build\java" mkdir "build\java"
IF NOT EXIST "build\class" mkdir "build\class"

PUSHD "build\java"

rem Transpile from JavaCC to Java
java -cp ..\..\javacc\target\javacc.jar javacc ..\..\Assignment.jj

rem Compile Java to make runnable interpreter
javac -Xlint:unchecked *.java -d ..\class

rem The following file runs the file after compiling 
rem CD ..\class && java Assignment

POPD

IF %ERRORLEVEL% GTR 0 (
    ECHO Compilation finished with errors
) ELSE (
    ECHO Sucessful compilation
)

PAUSE
