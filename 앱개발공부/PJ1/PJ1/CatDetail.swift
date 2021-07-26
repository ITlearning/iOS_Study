//
//  CatDetail.swift
//  PJ1
//
//  Created by IT learning on 2021/05/30.
//

import SwiftUI

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


struct CatDetail_Previews: PreviewProvider {
    static var previews: some View {
        CatDetail(cat: Cat(name: "루루", age: 3, imageURL: "루루", height: 20, weight: 3.05, ment: "\"(두 발로 일어서며) 루루애오!\""))
        }
    }
}
