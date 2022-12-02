//
//  FocusModeView.swift
//  PrepAir-1
//
//  Created by Yiwen Zhao on 11/29/22.
//

import SwiftUI

struct FocusModeView: View {
    @State private var timeRemaining = 60*15
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    @State private var contentOffset = CGFloat(0)
    @State var homeViewShow = false
    
    //@State var userName: String = ""
    
    var body: some View {
        ZStack {
            //Rectangle 1
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
                .frame(width: 393, height: 1000)
            //Color.blue.ignoresSafeArea(.all)
            
            TrackableScrollView(offsetChanged: { offset in
                contentOffset = offset.y
                print("contentOffset", contentOffset)
                print(LoginView().$userName)
                if contentOffset < -100 {
                    withAnimation {
                        homeViewShow = true
                    }
                }
            }) {
                VStack {
                    //DL 314
                    Text("DL 314")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                        .padding(.top, 230)
                    
                    HStack {
                        //Countdown
                        Text("\(timeRemaining / 60) ")
                            .font(.system(size:128))
                            .foregroundColor(.white) +
                        Text("min")
                            .font(.system(size:36))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading)
                    
                    HStack {
                        Text("\(timeRemaining % 60) ")
                            .font(.system(size:128))
                            .foregroundColor(.white) +
                        Text("sec")
                            .font(.system(size:36))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading)
                    
                    //left for domestic security
                    Text("left for domestic security")
                        .font(.system(size : 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    //Spacer()
                    Image("Group 8")
                        //.padding(.bottom, 150)
                        .offset(y : 100)
                    
                }
            }
            if homeViewShow {
                
                HomeView(userName: LoginView().$userName)
                    //.offset(y:75)
            }
        }.ignoresSafeArea()
        .onReceive(timer) {
            time in guard isActive else {return}
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            newPhase in if newPhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
        
    }
}

struct FocusModeView_Previews: PreviewProvider {
    static var previews: some View {
        FocusModeView()
    }
}
