# 버스앱이 없는 시골에서 살아남기 위해 만드는 앱
## 당진 버스 
### 기획의도
버스를 타려고 시중에 잘 나와있는 앱을 켜도, 시간은 커녕 노선도 제대로 나와있지 않은것을 보고 적잖게 충격을 받아 시작하게 됨.

### (구현하고 싶은) 기능
- 실시간 버스 위치 확인
- 몇분후 버스가 도착하는지 메인에 뜨기
- 푸시 알람도 가능하면 하고싶다.
- UX좀 제대로 개선하고 싶다.
- 지하철 노선도처럼 노선도 앱 하나로 볼 수 있게 하고 싶음.

### 그래서 구현된 기능
- 현재날짜,시간 보이게 하기 ( ㅋㅋㅎㅎㅋㅎㅋㅎㅋㅎㅋ)
- 현재 위치 레이블 표시(주소로 뜬다. 예를들어 이 앱은 당진 전용이니 "당진 수청동"과 같은 느낌으로 뜬다.)
- 전국 버스 조회 API 사용 가능
- 메인 뷰의 Location 버튼을 누르면 현재 위치 리프레시 가능
- 현재 내 위치 주변 750M 버스 정류장 표시(는 아직 디버그 창에서만 확인 가능) (아직 Label, Table View가 미숙해서)

### 현재 전체 뷰 
#### Dark Mode
![image](https://user-images.githubusercontent.com/11778058/127009507-6651b7f1-5214-410d-b863-38f12721ca38.png)
#### Default Mode
![image](https://user-images.githubusercontent.com/11778058/127011225-cc419256-1c73-4159-a22d-b95cfee6e726.png)


### 사용된 기술(?)(아니 기술은 아니고 배운 것들)
- 오토레이아웃
- API Parsing, Using API
- Navigation Controller 응용, 사용
- Navigation Bar 조정(색, 블러처리, 크기 변경등)
- Adobe XD 사용법 터득

### 구현해야 하는것 (당장 해야하는 것들 순임)
- 파싱해온 버스정류장들 위치순으로 정렬하여 레이블에 표시 
- 메인 뷰에서 "가장 가까운 버스정류장" 버튼에 제일 가까운 정류장 보여지게 구현
- 테이블 뷰 구현
- (만약 가능하다면) 가장 가까운 버스정류장에 도착하려는 버스들 조회 가능
- 전체 버스 노선도 구현 (되도록이면 지하철 노선도처럼, 아니면 리스트 형식으로 직관적으로 보이게, 카카오 버스, 카카오 맵, 네이버 맵 등등과 비슷하게)
- 자주 리프레싱 되는 로케이션 업데이트 조금은 줄이기(배터리 소모를 막기위해)