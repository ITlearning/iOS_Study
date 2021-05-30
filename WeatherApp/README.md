#  WeatherApp - SwiftUI Practice App

출처 - https://seons-dev.tistory.com/133?category=840156 

블로그의 글을 보며 학습하고 있는 SwiftUI 앱 개발 예시 중 하나인 날씨 앱을 제작해보았다.

* * *
### 구동 사진 
<p align="center">
<img width="182" alt="스크린샷 2021-05-30 오후 8 49 26" src="https://user-images.githubusercontent.com/11778058/120103020-8bcb4680-c188-11eb-9b71-4248926bd3ba.png">
<img width="200" alt="스크린샷 2021-05-30 오후 8 20 01" src="https://user-images.githubusercontent.com/11778058/120102464-22e2cf00-c186-11eb-92c6-cd0a96f3624c.png">
</p>

* * *

### 코드 설명 

### MainView
```swift
struct ContentView: View {
    // @State 로 isNight라는 값을 false로 정해준다.
    // 상태 프로퍼티는 현재 상태를 저장하기 위해서만 사용한다.
    // 상태 프로퍼티가 변경되었다는 뜻은, 그 프로퍼티가 선언된
    // 뷰 계층 구조를 다시 렌더링 해야한다는 Swift의 신호이다.
    @State var isNight = false
    
    var body: some View {
        ZStack{
            // 배경화면 설정
            // LinearGradient는 가장 기본적인 그라데이션 효과이다.
            // isNight을 사용하기 위해서 Binding에 상태 프로퍼티 위임
            backgroundView(isNight: $isNight)
            VStack{
                VStack(alignment: .center, spacing: 10) {    // 메인 정보
                    cityName(title: "서울 (Seoul)") // 메인지역 이름 표시
                    mainweatherIconView(ImageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: isNight ? 5 :25)  //메인지역 날씨 정보
                }
                Spacer()
                // 스택처럼 하나씩 하나씩 쌓는 방법
                HStack(spacing: 10){
                    WeatherInfo(dayOfWeek: "월", ImageName: "sun.max.fill", temprature: 23)
                    WeatherInfo(dayOfWeek: "화", ImageName: "cloud.rain.fill", temprature: 21)
                    WeatherInfo(dayOfWeek: "수", ImageName: "cloud.sun.rain.fill", temprature: 22)
                    WeatherInfo(dayOfWeek: "목", ImageName: "sun.max.fill", temprature: 25)
                    WeatherInfo(dayOfWeek: "금", ImageName: "sun.max.fill", temprature: 21)
                }
                Spacer()
                // 버튼 구현
                Button(action: {
                                  
                self.isNight.toggle()
                                  
                }) {
                    weatherButton(title: isNight ? "라이트모드로 전환" : "다크모드로 전환", backgroundColor: isNight ? .gray : .white, textColor: isNight ? .white : .blue)
                }
                Spacer()
            }
            .padding()
            
        }
    }
}
```

#### Main 주요 코드

```swift
@State var isNight = false
```

@State 로 isNight라는 값을 false로 정해준다.

위 @State는 상태 프로퍼티로, 현재의 상태를 저장하는 프로퍼티이다. 현재 상태 저장 이외에는 사용이 불가능하다.

전환을 해야 하는 위 앱처럼 특정 상황이 바뀌면 앱 이미지나, 환경이 달라져야 할 때 상태 프로퍼티를 사용한다.



#### 배경화면 설정

```swift
struct backgroundView: View {
    // 하위 뷰에서 isNight을 사용하려면 Binding으로 isNight 상태 프로퍼티에 접근할 수 있다.
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            // 위에 상태바를 무시하는 코드
            .edgesIgnoringSafeArea(.all)
    }
}

```
메인 상태 프로퍼티가 존재하기 떄문에 하위 뷰인 백드라운드 뷰에서 사용하기 위해 @Binding 키워드를 사용했다.

LinearGradient를 이용하여 그라데이션이 나오는 배경을 설정했고, 매개변수를에 **옵셔널**을 사용하여, isNight의 상태에 따라 색이 변하게 설정했다.


#### 메인지역 이름
```swift
struct cityName: View {
    var title: String
    
    var body: some View {
        Text(title)
            // 폰트 설정
            .font(.system(size: 33))
            // 폰트 컬러
            .foregroundColor(.white)
    }
}
```

화면에서 가장 크게나오는 메인지역의 이름을 설정해주는 뷰이다.
매개변수로 지역 이름을 받고 설정해준다.


#### 메인지역 날씨표시
```swift
struct  mainweatherIconView: View {
    
    var ImageName: String
    var temperature: Int
    
    
    var body: some View {
        Image(systemName: ImageName)
            .resizable() // 크기조정
            .renderingMode(.original) // 원래 컬러 그대로 보고 싶으면 무조건 넣어야 한다.
            .frame(width:100, height:100, alignment: .center) // 프레임
            .aspectRatio(contentMode: .fit)
        
        Text("\(temperature)°")
            .font(.system(size: 60))
            .foregroundColor(.white)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
```

이것도 화면에서 제일 크게 나오는 메인지역의 날씨를 표시해주는 뷰이다. 

각각 이미지의 이름(아이콘의 고유 이름)과 온도를 입력 받고, 아래 body에서 정의한 대로 보여준다.

#### 평일(5일)날씨 표시화면
```swift
struct WeatherInfo: View {
    
    var dayOfWeek: String
    var ImageName: String
    var temprature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .bold)) // weigth 는 글자굵기
                .foregroundColor(.white)
                .shadow(radius: 30)
                .padding()
            Image(systemName: ImageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
            
            Text("\(temprature)°")
                .font(.system(size:20))
                .foregroundColor(.white)
        }
    }
}
```
메인 바로 아래에 위치한 평일 5일의 날씨를 알려주는 뷰 코드이다.

위 코드 또한 매개변수를 받아 처리한다. 

Image에 코드들이 생각보다 흥미로웠는데,
```
.renderingMode(.original)
```
위 코드를 시스템 아이콘에서 사용하지 않을 경우, 원래의 색이 나오지 않고 어둡거나 하얀색의 아이콘이 보인다.

따라서 원 색을 쓰고 싶다면 꼭 넣자.


#### 다크모드 변환 버튼
```swift
struct weatherButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    
    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .frame(width: 300, height: 70)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(20) // 코너 라운딩
            .shadow(radius: 5)
    }
}
```
앱의 아랫부분에 위치하는 버튼이다.

```
.cornerRadius(20)
```
박스에 코너를 넣고 싶으면 위 코드를 사용해야 한다.
