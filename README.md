# Tasty Korea

> 외국인 들을 위한 한국 식당 소개 팀 프로젝트

TastyKorea는 약3주 동안 준비한 kh정보교육원에서 진행한 프로젝트 입니다. 5명의 팀원이 함께 참여를 하였고 외국인들을 대상으로 한 국내 식당을 소개해주고 예약이 가능한 프로젝트 입니다.

## Features

### Client

1. 예약: Full Calendar API를 사용하여 예약가능한 시간을 선택하여 AJAX를 사용하여 예약 & 취소가능 하며 사용자 이모티콘을 누르며 팝오버 형태로 예약현황가 찜 리스트를 확인 가능
2. 찜: AJAX를 사용하여 찜하기, 취소하기 가능하며 비지니스 멤버가 접속해 있다면 Web Socket을 이용하여 실시간으로 알람 전송
3. 별점 && 댓글 : AJAX를 이용한 별점과 댓글 기능
4. 채팅 : Web Socket을 이용한 업체와 1:1 채팅

### Business

1. 업체 정보 등록: 업체의 기본 정보와 휴일과 예약 시간을 등록
2. 메뉴 번역 신청: Naver 파파고 번역 API를 사용하여 한글로 입력한 메뉴를 자동 번역
3. 대시보드: 결제를 하면 확인이 가능하며 Chart.js 라이브러리를 사용하여 예약자 수 연령별, 국적별 비교가 가능하고 별점, 예약자수, 좋아요 수도 확인 가능
4. 결제,환불: I'M PORT 결제 API를 이용한 결제,환불
5. 예약 관리: 업체는 사용자의 예약 현황을 볼수있고 강제로 취소가능
6. 채팅: 사용자와 1:1 채팅 가능

### Admin

1. 번역 요청 확인 및 수정 : 자동 번역이 마음에 들지 않는 경우 업체는 번역 수정을 요청하고 관리자는 번역을 수정가능
2. 업체 회원 관리: 주간 리뷰수가 일정 수 보다 많으면 의심 업체에 등록이 되며 강제 탈퇴를 시킬수 있음
3. 대시보드: 기간별 가입자수, 가입자 연령, 가입자 타입에 대한 정보 확인가능

## Requirements

- Java 15
- Spring 4
- JSP
- BootStrap
- Oracle 11g
- MyBatis

### 사용된 API

- Google reCAPTCHA
- NAVER 파파고 자동 번역
- KAKAO MAP
- I`M PORT (결제)
- Full Calendar (달력)
- Daum PostCode (주소)

## Contributors

- 김사용: 예약, 찜, 알람, 결제, 예약관리 [GitHub](https://github.com/youss95)
- 임예이: 회원가입, 로그인, 회원 수정, 메뉴 번역, 관리자 파트 [GitHub](https://github.com/hiki-como)
- 김가영: Client, Business 채팅 [GitHub](https://github.com/gayoung98)
- 이광재: 메인 화면, 공공데이터 포털 자료로 업체 등록, 업체 상세 페이지, 별점 & 댓글 [GitHub](https://github.com/dfsdfsdfadasf)
- 이윤서: 비즈니스 회원가입, 로그인, 대시보드, 사진 업로드, 업체 회원 관리 [GitHub](https://github.com/riicoseo)
