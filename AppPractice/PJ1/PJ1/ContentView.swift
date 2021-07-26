//
//  ContentView.swift
//  PJ1
//
//  Created by IT learning on 2021/05/30.
//

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
