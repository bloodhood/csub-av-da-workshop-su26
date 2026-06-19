@echo off
echo ========================================
echo   Stroke Risk Analysis - Full Pipeline
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0run.ps1"

echo.
echo ========================================
echo   COMPLETE - Results saved to:
echo   analysis_output.ipynb
echo ========================================
echo.

start "" "%~dp0analysis_output.ipynb"

pause
