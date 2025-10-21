# aware - MCP Observability CLI

MCP (Model Context Protocol) 서버에 Aware 로깅 기능을 쉽게 추가할 수 있는 CLI 도구입니다.

> **참고**: 이 저장소는 배포용 바이너리만 포함합니다. 소스코드는 비공개입니다.

## 빠른 설치

### Stable (안정 버전)
```bash
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | sh
```

### Develop (개발 버전)
```bash
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | BRANCH=develop sh
```

### 특정 버전 설치
```bash
# Stable 특정 버전
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | VERSION=v0.1.0 sh

# Develop 특정 버전
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | VERSION=v0.1.0-dev BRANCH=develop sh
```

## 지원 플랫폼

- macOS (Intel, Apple Silicon)
- Linux (x86_64, ARM64)

## 사용법

### 1. 로그인
```bash
aware login
```
API 키를 입력하여 인증합니다.

### 2. MCP 설정 변환
```bash
# 모든 MCP 서버 설정 변환
aware configure

# 특정 서버만 변환
aware configure slack

# Python wrapper 사용
aware configure --python
```

### 3. 상태 확인
```bash
aware status
```

### 4. 업데이트
```bash
# Stable 최신 버전으로 업데이트
aware update

# Develop 최신 버전으로 업데이트
aware update --develop
```

## 지원 클라이언트

- Claude Desktop
- Cursor
- Claude Code (VS Code Extension)

## 버전 정보

현재 설치된 버전 확인:
```bash
aware --version
```

## 문제 해결

### 설치 실패
```bash
# curl이 없는 경우
brew install curl  # macOS
apt-get install curl  # Linux

# 권한 문제
sudo curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | sh
```

### 로그인 실패
API 키가 올바른지 확인하세요. 키는 `~/.aware_credentials`에 저장됩니다.

## 라이선스

MIT License

## 문의

문제가 발생하거나 질문이 있으시면 이슈를 등록해주세요.
