REM add MSBuild to env variable
set MSBuild="c:/Program Files (x86)/MSBuild/12.0/bin/msbuild.exe"

REM add vcvars32.bat to PATH
@set PATH=c:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin;%PATH%

REM create build, package && install directory
if not exist build mkdir build
if not exist package mkdir package
if not exist install mkdir install

call :setup Win32 Debug   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call :setup Win32 Release & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call :setup x64 Debug     & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call :setup x64 Release   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call install_jsoncpp.bat || goto :error

call :setup Win32 Debug   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call :setup Win32 Release & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call :setup x64 Debug     & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call :setup x64 Release   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call install_microhttpd.bat || goto :error

call :setup Win32 Debug   & call build_curl.bat        & call bundle_curl.bat || goto :error
call :setup Win32 Release & call build_curl.bat        & call bundle_curl.bat || goto :error
call :setup x64 Debug     & call build_curl.bat        & call bundle_curl.bat || goto :error
call :setup x64 Release   & call build_curl.bat        & call bundle_curl.bat || goto :error
call install_curl.bat || goto :error

call :setup Win32 Debug   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat || goto :error
call :setup Win32 Release & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat || goto :error
call :setup x64 Debug     & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat || goto :error
call :setup x64 Release   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat || goto :error
call install_jsonrpccpp.bat || goto :error

call :setup Win32 Debug   & call build_cryptopp.bat    & call bundle_cryptopp.bat || goto :error
call :setup Win32 Release & call build_cryptopp.bat    & call bundle_cryptopp.bat || goto :error
call :setup x64 Debug     & call build_cryptopp.bat    & call bundle_cryptopp.bat || goto :error
call :setup x64 Release   & call build_cryptopp.bat    & call bundle_cryptopp.bat || goto :error
call install_cryptopp.bat || goto :error

call :setup Win32 both    & call build_boost.bat       & call bundle_boost.bat || goto :error
call :setup x64 both      & call build_boost.bat       & call bundle_boost.bat || goto :error
call install_boost.bat

call :setup Win32 Debug   & call build_leveldb.bat     & call bundle_leveldb.bat || goto :error
call :setup Win32 Release & call build_leveldb.bat     & call bundle_leveldb.bat || goto :error
call :setup x64 Debug     & call build_leveldb.bat     & call bundle_leveldb.bat || goto :error
call :setup x64 Release   & call build_leveldb.bat     & call bundle_leveldb.bat || goto :error
call install_leveldb.bat || goto :error

goto :EOF

:setup
set PLATFORM=%1
set CONFIGURATION=%2

goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%

:EOF

