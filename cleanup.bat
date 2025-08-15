@echo off
echo Cleaning up old Neovim configuration...

REM Remove old lazy-lock.json to allow fresh plugin installation
if exist "lazy-lock.json" (
    echo Removing old lazy-lock.json...
    del "lazy-lock.json"
)

REM Remove lazy plugin cache
if exist "%LOCALAPPDATA%\nvim-data\lazy" (
    echo Removing lazy plugin cache...
    rmdir /s /q "%LOCALAPPDATA%\nvim-data\lazy"
)

REM Remove mason installations to force fresh install
if exist "%LOCALAPPDATA%\nvim-data\mason" (
    echo Removing mason installations...
    rmdir /s /q "%LOCALAPPDATA%\nvim-data\mason"
)

REM Remove base46 cache
if exist "%LOCALAPPDATA%\nvim-data\base46" (
    echo Removing base46 cache...
    rmdir /s /q "%LOCALAPPDATA%\nvim-data\base46"
)

echo.
echo Cleanup complete! 
echo.
echo Next steps:
echo 1. Start Neovim
echo 2. Let Lazy.nvim install plugins automatically
echo 3. Run :MasonInstallAll to install LSP servers and tools
echo 4. Restart Neovim
echo.
pause
