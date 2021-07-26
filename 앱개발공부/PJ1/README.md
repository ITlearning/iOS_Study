# Cat Dictionary App - SwiftUI Practice App

크림 히어로즈 고양이 소개 앱

따라한 자료 - (https://seons-dev.tistory.com/55?category=840156)

<p align="center">
<img width="200" alt="1" src="https://user-images.githubusercontent.com/11778058/120175662-69493400-c241-11eb-9c58-b055e496a15f.png">
<img width="196.5" alt="2" src="https://user-images.githubusercontent.com/11778058/120175707-749c5f80-c241-11eb-9d94-09b8ff0b3097.png">
<img width="198" alt="3" src="https://user-images.githubusercontent.com/11778058/120175716-76662300-c241-11eb-8848-da3b08b2846f.png">
<img width="200" alt="4" src="https://user-images.githubusercontent.com/11778058/120175725-79611380-c241-11eb-98d4-38d3555d849e.png">
 </p>
 
 
## 코드 소개

### ContentView.swift
```swift
import SwiftUI

struct ContentView: View {
    
    let cat = Cat.all()
    
    var body: some View {
        NavigationView {
            List(self.cat, id: \.name) { cat in
            // 네비게이션링크 생성
                NavigationLink(destination: CatDetail(cat: cat)) {
                    CatList(cat: cat)
                }
            }
            .navigationTitle("크림히어로즈 냥이들")
            .padding(.top, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CatList: View {
    let cat: Cat
    var body: some View {
        HStack {
            Image(cat.imageURL)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            VStack(alignment:.leading){
                Text(cat.name)
                    .font(.system(size: 30))
                    .bold()
                Text("나이 : \(cat.age) 살")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(String(format: "꼬리 길이 : %.0f cm", cat.height))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}
```
**NavigationView**
```swift
NavigationView {
            List(self.cat, id: \.name) { cat in
            // 네비게이션링크 생성
                NavigationLink(destination: CatDetail(cat: cat)) {
                    CatList(cat: cat)
                }
            }
            .navigationTitle("크림히어로즈 냥이들")
            .padding(.top, 20)
        }
```
**NavigationView** 는 화면을 계층적으로 보여주고 싶을때 사용하는 아주 중요한 틀이다. **NavigationView**를 선언하면 자연스레 Navigation Bar가 구현된다.
**NavigationLink** 를 사용하면 스택형식으로 자신이 원하는 목록들이 생성되고, 눌렀을 경우의 액션을 설정해줄 수 있다. 위 코드의 경우엔 고양이 정보가 뜨게끔 설정해놨다.

**CatList**
```swift
struct CatList: View {
    let cat: Cat
    var body: some View {
        HStack {
            Image(cat.imageURL)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            VStack(alignment:.leading){
                Text(cat.name)
                    .font(.system(size: 30))
                    .bold()
                Text("나이 : \(cat.age) 살")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(String(format: "꼬리 길이 : %.0f cm", cat.height))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}
```




 
CatList 에선 리스트에서 누른 해당 고양이의 정보가 표시되게 코드를 짰다. HStack과 VStack을 번갈아 쓰면서 해당 뷰의 Text를 표현 해보았다.

* * *

### CatDetail.swift
```swift
struct CatDetail: View {
    
    let cat: Cat
    @State private var zoomed: Bool = false
    @State private var animationAmount = 0.0
    var body: some View {
        VStack(alignment:.center){
            Image(cat.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(self.zoomed ? 170 : 20)
                // 터치시 주는 효과
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 100, damping: 50)) {
                        self.zoomed.toggle()
                        self.animationAmount += 360
                    }
                }
                .rotation3DEffect(
                    .degrees(animationAmount),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
                .padding(.bottom, 120)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center){
                HStack {
                    Image(systemName: "star.square.fill")
                        .font(.title)
                    Text("고양이 정보")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                }
                HStack{
                    VStack{
                        Text("Name")
                            .fontWeight(.thin)
                        Text("\(cat.name)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 50))
                    }
                    
                    Spacer()
                    VStack (alignment: .leading){
                        Text(" \(cat.name)'s Profile")
                        Text("나이:\t\t\(cat.age)살")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                        Text("꼬리길이 : \(String(format: "%.0f", cat.height)) cm")
                            .font(.subheadline)
                            .fontWeight(.light)
                        Text("몸무게 : \(String(format: "%.2f", cat.weight))  Kg")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                }
                .padding(.trailing, 60)
                .padding(.leading, 40)
            }
            .offset(y: -130)
            VStack {
                Text("\(cat.ment)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .offset(y: -70)
        }
        // 네비게이션타이틀을 사용할때 Cat.name을 사용하려면 항상 Text매개변수가 와야한다.
        .navigationTitle("크림 히어로즈 '\(cat.name)'")
        // 네비게이션 타이틀을 제대로 넣으려면 위 코드를 삽입
        .navigationBarTitleDisplayMode(.inline)
}
```

**Body: Image**
```swift
Image(cat.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(self.zoomed ? 170 : 20)
                // 터치시 주는 효과
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 100, damping: 50)) {
                        self.zoomed.toggle()
                        self.animationAmount += 360
                    }
                }
                .rotation3DEffect(
                    .degrees(animationAmount),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
                .padding(.bottom, 120)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
```


Image부분에 새로운 기능들이 많이 들어갔다. 먼저 onTapGesture 기능을 사용해 해당 이미지를 눌렀을 경우에 생기는 액션을 정의한 곳이다.
필자는 누를시 사진이 360도 회전하는 모션을 추가했고, 그 아래 기능에 rotation3DEffect 기능으로 도는 모습을 3D로 돌게끔 설정했다.

**Body: LastLine**
```swift
// 네비게이션타이틀을 사용할때 Cat.name을 사용하려면 항상 Text매개변수가 와야한다.
        .navigationTitle("크림 히어로즈 '\(cat.name)'")
        // 네비게이션 타이틀을 제대로 넣으려면 위 코드를 삽입
        .navigationBarTitleDisplayMode(.inline)
```

body부분의 마지막 닫은중괄호 부분에 navigationTitle을 사용하여 navigation Bar에 출력되는 문구를 수정했다.
그런데 저 코드만 사용했을 시 문자열이 너무나도 크게 표시가 되어 문제였었다. 그래서 navigationBarTitleDisplayMode(.inline)을 사용하여 해당 문자열을 Navigation Bar 안에 들어가게끔 설정을 해줬다.

* * *
### Cat.swift
```swift
struct Cat {
    let name: String
    let age: Int
    let imageURL: String
    let height: Double
    let weight: Double
    let ment: String
}

extension Cat {
    static func all() -> [Cat] {
        
        return [
            Cat(name: "루루", age: 3, imageURL: "루루", height: 16, weight: 2.90, ment: "\"(두 발로 일어서며) 루루애오!\""),
            Cat(name: "티티", age: 5, imageURL: "티티", height: 28, weight: 4.51, ment: "\"나 표정 원래 이래, 알잖아!\""),
            Cat(name: "디디", age: 5, imageURL: "디디", height: 34, weight: 6.02, ment: "\"디디-귀엽다. 디디-빵 줘라.\"")
        ]
    }
}

```

Cat.swift에는 고양이에 대한 extension 값을 넣어준 파일이다. 위와같이 함수를 생성해주고, 딕셔너리로 고양이에 대한 정보를 저장했다.

Apple은 이렇게 파일을 나누는것을 적극 권장하고 있다. extension부터, Detail등등을 파일과 같은 형식으로 다 따로 선언 후 코딩을 권장한다. mainView에서는 각 파일에 대한 함수들을 불러오는 방법을 사용한다.
