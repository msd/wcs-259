@ECHO off

IF NOT EXIST "build\java\" (
    ECHO Build directory not found, did you forget to compile?
    PAUSE
    EXIT /B 1
)

IF NOT EXIST "build\class\Assignment.class" (
    ECHO Java classes not found, please try compiling again
    PAUSE
    EXIT /B 1
)

IF NOT EXIST "input.txt" (
    @COPY /Y NUL "input.txt" > NUL
    ECHO Created file input.txt
    ECHO Please write the source code to be executed there
    PAUSE
    EXIT /B 1
)

PUSHD "build\class"
java Assignment < ../../input.txt
POPD

PAUSE
