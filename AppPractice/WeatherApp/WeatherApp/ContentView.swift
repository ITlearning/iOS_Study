//
//  ContentView.swift
//  WeatherApp
//
//  Created by IT learning on 2021/05/30.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: 주간날씨 표시화면
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


//MARK: 배경화면 설정
struct backgroundView: View {
    // 하위 뷰에서 isNight을 사용하려면 Binding으로 isNight 상태 프로퍼티에 접근할 수 있다.
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            // 위에 상태바를 무시하는 코드
            .edgesIgnoringSafeArea(.all)
    }
}

//MARK: 메인지역 이름
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


//MARK: 메인지역 날씨 표시
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


//MARK: 다크모드 변환 버튼
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
