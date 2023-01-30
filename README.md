# 첫번째 게시판 구현의 환경 설정

### 1. 다이나믹 웹프로젝트 만들기
* 주의: web.xml 체크하기
### 2. git 연동
* .gitignore 파일 프로젝트 폴더에 저장
   * 내용은 gitignore.io 사이트에서 작성.(windows,eclipse,java,maven 입력)

### 3. 이클립스에서 git 시작하기(아래 명령어 위주로)
* git init - 로컬저장소 초기화
* git add - 선택한 파일 staging
* git commit - 현재 상태 커밋
* git remote add - 원격저장소 추가
* git push - 커밋 상태를 로컬에서 원격저장소로 전송
* https://docs.google.com/spreadsheets/d/1svu84vUmiMjZooO7ixXJ45pa46d1mX262o0yKI532_E/edit#gid=717910587 링크 2번부터 실행하세요.
(github 토큰 생성방법은 1번)
* git fetch - 원격 저장소의 master 변경 커밋 내용 확인
* git pull - 원격 저장소 master 의 변경 커밋 가져오기

### 4. 빌드도구
* gradle 또는 maven을 주로 사용.
* maven 으로 하겠습니다.
프로젝트 선택 - 오른쪽 버튼 메뉴 Configure - convert to maven project 
* pom.xml 의 오류는 run as 에서 maven install 후에
	프로젝트 우클릭 -> maven 에서 update project
* 빌드도구의 기능 1 : 외부 라이브러리를 관리
	* <dependencies></dependencies> 태그안에 필요한 라이브러리 설정합니다.(디펜던시는 의존성 즉 필요한 라이브러리)
	* pom.xml 파일이 수정되면 이클립스는 빌드를 새로 합니다. 오른쪽 아래 상태바가 움직이는지 꼭 확인하고 완료까지 기다리세요.
* 빌드도구의 기능 2 : 배포 파일(최종결과물-jar,war 확장자) 생성
  
