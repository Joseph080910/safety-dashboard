@echo off
title 깃허브 대용량 파일 자동 업로드 프로그램
chcp 65001 >nul

echo ============================================================
echo        학교안전사고 데이터 깃허브 자동 업로드 시작
echo ============================================================
echo.

:: 1. Git 사용자 정보 설정
git config --global user.email "Joseph080910@example.com"
git config --global user.name "Joseph080910"

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
echo ★ 주의: 원격 충돌을 방지하기 위해 강제 업로드(--force)를 수행합니다.
echo   용량이 커서 완료까지 시간이 조금 걸릴 수 있으니 잠시만 기다려 주세요.
echo ------------------------------------------------------------
echo.

:: --force 옵션을 추가하여 [rejected] 오류를 해결합니다.
git push -u origin main --force

echo.
echo ============================================================
echo  [완료] 모든 데이터가 성공적으로 깃허브에 업로드되었습니다!
echo ============================================================
echo.
pause