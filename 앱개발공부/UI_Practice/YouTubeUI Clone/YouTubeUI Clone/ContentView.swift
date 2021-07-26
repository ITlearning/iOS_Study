//
//  ContentView.swift
//  YouTubeUI Clone
//
//  Created by IT learning on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1529197991, green: 0.1529534459, blue: 0.1529176831, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    ControlPanel()
                    SelectionPanel()
                    ChannelPhoto()
                }
                .padding(.top, 60)
                .background(Color(#colorLiteral(red: 0.04657869786, green: 0.3595216274, blue: 0.4556114674, alpha: 1)))
                
                VStack {
                    LogoPannel()
                    //EditManage()
                    
                    Text("Uploads")
                        .padding(.trailing, 280) // 좌,우 간격
                        .padding(.vertical, 5) //  상,하 간격
                    
                    
                    FirstVideo()
                    SecondVideo()
                        .offset(y: -10)
                }
                
                Spacer()
                
                Menu()
                    .offset(y: -25)
            }
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: 컨트롤 패널
struct ControlPanel : View{
    var body: some View{
        HStack(spacing: 20){
            Image(systemName: "arrow.left")
            Text("크집사")
            Spacer()
            Image(systemName: "tv")
            Image(systemName: "magnifyingglass")
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
        }
        .padding(.bottom, 15)
        .font(.system(size: 20))
        .padding(.horizontal, 20)
    }
}

//MARK: 셀렉션 패널
struct SelectionPanel: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("Home")
            Text("Videos")
            Text("Playlists")
            Text("Channels")
        }.textCase(.uppercase) // 대문자로 바꾸기
    }
}

//MARK: 채널 배너
struct ChannelPhoto: View {
    var body: some View {
        Image("background")
            .resizable()
            .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .scaledToFit()
    }
}

//MARK: 채널 로고
struct LogoPannel: View {
    var body: some View{
        HStack {
            Image("unnamed")
                .resizable()
                .frame(width: 110, height: 100)
                .padding(.leading, 10)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 5){
                Text("크집사")
                    .font(.system(size: 20, weight: .bold))
                
                Text("구독자 115만명")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

//MARK: 매니저 세팅 부분
struct EditManage: View{
    var body: some View{
        HStack{
            Text("Edit channel")
                .textCase(.uppercase)
                .padding(.horizontal, 22)
                .padding(.vertical, 10)
                .foregroundColor(Color(#colorLiteral(red: 0.2706722021, green: 0.5761205554, blue: 0.8089080453, alpha: 1)))
                .border(Color(#colorLiteral(red: 0.2706722021, green: 0.5761205554, blue: 0.8089080453, alpha: 1)))
            Text("manage videos")
                .textCase(.uppercase)
                .padding(.horizontal, 22)
                .padding(.vertical, 10)
                .foregroundColor(Color(#colorLiteral(red: 0.2706722021, green: 0.5761205554, blue: 0.8089080453, alpha: 1)))
                .border(Color(#colorLiteral(red: 0.2706722021, green: 0.5761205554, blue: 0.8089080453, alpha: 1)))
        }
    }
}


struct FirstVideo: View {
    var body: some View{
        HStack (alignment: .top){
            Image("TiTI")
                .resizable()
                .frame(width: 180, height: 110)
                .scaledToFit()
            
            VStack (alignment: .leading){
                Text("티티가 먹을걸 원해요!")
                Text("루루 간식 빼먹기 대작")
                Text("전! - 크림 히어로즈")
                HStack{
                    
                    Text("60 Views")
                    Text("12 Hours ago")
                }.foregroundColor(.gray)
                .font(.system(size: 15))
            }
        }.padding(.bottom)
    }
}


struct SecondVideo: View {
    var body: some View{
        HStack (alignment: .top){
            Image("LuLu")
                .resizable()
                .frame(width: 180, height: 110)
                .scaledToFit()
            
            VStack (alignment: .leading){
                Text("루루가 간식을 너무 먹어")
                Text("서 고민이에요!")
                Text("루루의 간식 뺏기!")
                HStack{
                    
                    Text("1,005 Views")
                    Text("5 Days ago")
                }.foregroundColor(.gray)
                .font(.system(size: 15))
            }
        }.padding(.bottom)
    }
}


struct Menu: View{
    var body: some View{
        VStack{
            Rectangle()
                .frame(width: 400, height: 0.3)
                .foregroundColor(.gray)
                .padding(.bottom, 1)
        }.offset(y: 3)
        HStack(spacing: 30){
            VStack{
                Image(systemName: "house.fill")
                    .font(.system(size: 15))
                Text("Home")
                    .font(.system(size: 15))
            }
            
            VStack{
                Image(systemName: "safari")
                    .font(.system(size: 15))
                Text("Explore")
                    .font(.system(size: 15))
            }
            
            VStack{
                Image(systemName: "plus.rectangle")
                    .scaleEffect(1.5)
                    .padding(.horizontal, 2)
            }
            
            VStack{
                Image(systemName: "rectangle.stack.person.crop")
                    .font(.system(size: 15))
                Text("Subs")
                    .font(.system(size: 15))
            }
            
            VStack{
                Image(systemName: "play.rectangle")
                    .font(.system(size: 15))
                Text("Library")
                    .font(.system(size: 15))
                
            }
        }.padding(.bottom, 10)
    }
}
