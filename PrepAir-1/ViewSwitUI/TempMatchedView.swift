//
//  MatchedView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/30/22.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var slide = false
    @State var press = false
    @State var back = false
    @State var selectedTab = "Home"
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                ZStack {
                    //Rectangle 5
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 0.9416666626930237, green: 0.9416666626930237, blue: 0.9416666626930237, alpha: 1))).matchedGeometryEffect(id: "card", in: namespace)
                        .frame(width: 196, height: 218)
                        //.matchedGeometryEffect(id: "frame", in: namespace)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 10, x: 0, y: 4)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                    
                    VStack (alignment: .leading) {
                        //ATL -> LAX
                        Text("ATL -> LAX")
                            .font(.title.bold())
                            //.matchedGeometryEffect(id: "ATL LAX-font", in: namespace)
                            //.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                            .offset(y: -20)
                            .padding(.leading, 10)
                            .matchedGeometryEffect(id: "ATL LAX", in: namespace)
                            
                        //June 17th
                        Text("June 17th")
                            .font(.body)
                            //.fontWeight(.)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                            .offset(y: -20)
                            .padding(.leading, 10)
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text("1")
                                .font(.system(size: 64))
                                .offset(y: 30)
                                //.padding(.leading, 10)
                            Text("hr")
                                .font(.system(size: 20))
                                .offset(y: 30)
                            Text("25")
                                .font(.system(size: 64))
                                .offset(y: 30)
                            Text("mins")
                                .font(.system(size: 20))
                                .offset(y: 30)
                        }
                       
                    }

                }.onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
                /*
                Text("ATL -> LAX")
                    .matchedGeometryEffect(id: "HomeView", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                 */
            } else {
                VStack {
                    //DispatchQueue.main.asyncAfter(deadline: .now() + 3) {}
                    
                    Image("Back")
                        .padding([.leading, .top])
                        .frame(maxWidth: .infinity,alignment: .leading)
                        //.animation(.easeInOut.delay(1), value: show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                        
                    HStack {
                        Text("ATL -> LAX")
                            .padding([.leading, .bottom])
                            .font(.largeTitle.bold())
                            //.matchedGeometryEffect(id: "ATL LAX-font", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .matchedGeometryEffect(id: "ATL LAX", in: namespace)
                        
                        Image("Vector")
                            .padding(.trailing)
                            .padding(.bottom)
                            .frame(alignment: .trailing)
                        }
                    
                    //Rectangle 14
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(#colorLiteral(red: 0.3149999976158142, green: 0.3936268389225006, blue: 0.699999988079071, alpha: 1))).matchedGeometryEffect(id: "card", in: namespace)
                            .frame(width: 345, height: 316)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:10, x:0, y:4)
                            .matchedGeometryEffect(id: "rectangle", in: namespace)
                        
                        Image("Texts")
                            .offset(y : 35)
                            .animation(.easeInOut.delay(5), value: show)
                
                    } .offset(x: slide ? -150 : 0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0), value: slide)
                        .onTapGesture {
                            self.slide.toggle()
                        }
                            
                    withAnimation(.linear) {
                        Image("Group 2")
                            //.offset(y: -25)
                            .scaleEffect(press ? 0.95:1)
                            .animation(.spring(), value: press)
                            .onTapGesture {
                                self.press.toggle()
                                
                        }
                    }
                }
                /*
                //Rectangle 14
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(#colorLiteral(red: 0.3149999976158142, green: 0.3936268389225006, blue: 0.699999988079071, alpha: 1))).matchedGeometryEffect(id: "card", in: namespace)
                    .frame(width: 345, height: 316)
                    //.matchedGeometryEffect(id: "frame", in: namespace)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:10, x:0, y:4)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                 */
                /*
                Text("ATL -> LAX")
                    .matchedGeometryEffect(id: "HomeView", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                 */
            }/*
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
              */
        }
    }
}


struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
