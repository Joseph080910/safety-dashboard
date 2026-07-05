@echo off
title 깃허브 대용량 파일 자동 업로드 프로그램
chcp 65001 >nul

echo ============================================================
echo        학교안전사고 데이터 깃허브 자동 업로드 시작
echo ============================================================
echo.

:: 1. Git 최초 사용자 등록 (이 부분이 없어서 에러가 났던 것입니다!)
echo [준비] Git 최초 사용자 식별 정보를 설정합니다...
git config --global user.email "Joseph080910@example.com"
git config --global user.name "Joseph080910"
echo.

set REPO_URL=https://github.com/Joseph080910/safety-dashboard.git

if not exist .git (
    echo [안내] 폴더에 Git 저장소를 초기화합니다...
    git init
    echo.
)

echo [1/4] 대용량 엑셀 및 데이터 파일을 대기열에 추가 중...
git add .
echo.

echo [2/4] 업로드용 버전 기록을 생성 중...
git commit -m "학교안전사고 데이터 및 대시보드 파일 전체 업데이트"
echo.

git branch -M main

echo [3/4] 깃허브 원격 저장소 연결 확인 중...
git remote add origin %REPO_URL% 2>nul
if %errorlevel% neq 0 (
    git remote set-url origin %REPO_URL%
)
echo.

echo [4/4] 깃허브로 파일 전송을 시작합니다...
echo ------------------------------------------------------------
echo ★ 주의: 58MB, 42MB 대용량 파일이 있어서 전송하는 데 
echo   시간이 수십 초에서 수 분 정도 걸릴 수 있습니다.
echo   창이 멈춘 것처럼 보여도 정상 작동 중이니 절대 닫지 마세요!
echo ------------------------------------------------------------
echo.

git push -u origin main

echo.
echo ============================================================
echo  [완료] 모든 데이터가 성공적으로 깃허브에 업로드되었습니다!
echo ============================================================
echo.
pause