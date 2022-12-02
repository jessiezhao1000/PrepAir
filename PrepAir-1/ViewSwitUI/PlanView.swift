//
//  PlanView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/30/22.
//

import SwiftUI

struct PlanView: View {
    @State var slide = false
    @State var press = false
    @State var back = false
    @State var selectedTab = "Home"
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            VStack {
                Image("Back")
                    .padding([.leading, .top])
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .onTapGesture {
                        back.toggle()
                    }
                
                HStack {
                    Text("ATL -> LAX")
                        .padding([.leading, .bottom])
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image("Vector")
                        .padding(.trailing)
                        .padding(.bottom)
                        .frame(alignment: .trailing)
                    }
                
                //Rectangle 14
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 0.3149999976158142, green: 0.3936268389225006, blue: 0.699999988079071, alpha: 1)))
                        .frame(width: 345, height: 316)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:10, x:0, y:4)
                    
                    VStack {
                        Text("Domestic Security")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("40 mins")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25)
                        Text("To Gate")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("15 mins")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25)
                        Text("Boarding")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("10 mins")
                            .foregroundColor(.white)
                            .font(.system(size : 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25)
                        Spacer()
                        HStack {
                            Text("Total:")
                                .foregroundColor(.white)
                                .font(.system(size : 24))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("1")
                                .foregroundColor(.white)
                                .font(.system(size : 48))
                                .fontWeight(.bold) +
                            Text("hr ")
                                .foregroundColor(.white)
                                .font(.system(size : 17))
                                .fontWeight(.bold) +
                            Text("5")
                                .foregroundColor(.white)
                                .font(.system(size : 48))
                                .fontWeight(.bold) +
                            Text("min")
                                .foregroundColor(.white)
                                .font(.system(size : 17))
                                .fontWeight(.bold)
                        }.padding(.trailing, 50)
                    }.frame(width: 340, height: 250)
                    .padding(.top, 40)
                    .padding(.bottom, 30)
                    .padding(.leading, 50)
            
                } .offset(x: slide ? -150 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0), value: slide)
                    .onTapGesture {
                        self.slide.toggle()
                    }
                    
                        
                Image("Group 2")
                    //.offset(y: -25)
                    .scaleEffect(press ? 0.95:1)
                    .animation(.spring(), value: press)
                    .onTapGesture {
                        self.press.toggle()
                        
                    }
            }
            if back {
                HomeView(userName: .constant(""))
            }
        }
       
    }
}


struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
