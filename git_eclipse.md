### 1. [[준비]] github 사이트에 로그인해서

* 1) 리포지토리를 새로 만듭니다. 이름은 예시 : java_classwork
* 2) 미리 url 복사해놓으세요. : https://github.com/xxxx/java_classwork.git
* 3) 인증방식이 토큰입니다. github에서 토큰을 미리 준비하세요. 

메뉴 Settings -> Developer Settings -> Personal access tokens
         -> Generate new token 
-> 체크할것 repo 전체,  admin:org, admin:repo_hook ,user 
-> Generate token 클릭 -> 생성된 토큰값을 복사해 놓으세요.
(password 대신 입력)

### 2. 원격저장소 설정하고 연결
Open Perspective 에서 git 을 선택합니다.

* 1) 왼쪽 상단에 Git Repositories 탭 : 프로젝트 열기
* 2) Remote 에서 추가 : 우클릭 create remote
                   ㄴ Configure fetch 로 합니다.
* 3) create 클릭
* 4) 다음화면에서 Change 클릭
* 5) URI에 1번에서 복사한 정보 붙여넣기
   User 에 본인 github 이메일계정, 패스워드에는 토큰값
* 6) Save and Fetch 버튼 클릭

### 4. .gitignore 파일 준비.


### 5. 작성된 소스코드를 원격저장소에 전송  (Git staging 탭에서 합니다.)
 스테이징 - commit -push
1) Working Tree 클릭
2) 스테이징 초록++ 버튼 클릭
3) commit : 메시지 작성
4) push

((참고))
오류생겨서 다시하고 싶으면
Team - disconnect 하고
파일탐색기에가서 로컬저장소 폴더 안에 .git 을 삭제하세요.
