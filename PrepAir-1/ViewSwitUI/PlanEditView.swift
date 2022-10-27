//
//  PlanEditView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/31/22.
//

import SwiftUI

struct PlanEditView: View {
    @State var slide = false
    @State var press = false
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color.white)
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea()
            VStack {
                    //DispatchQueue.main.asyncAfter(deadline: .now() + 3) {}
                    
                    Image("Back")
                        .padding([.leading, .top])
                        .frame(maxWidth: .infinity,alignment: .leading)
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
                            //.animation(.easeInOut.delay(1), value: show)
                
                    } .offset(x: slide ? -150 : 0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0), value: slide)
                        .onTapGesture {
                            self.slide.toggle()
                        }
                if show {
                    withAnimation(.spring()) {
                        Image("Group 2")
                            //.offset(y: -25)
                            .scaleEffect(press ? 0.95:1)
                            .animation(.spring(), value: press)
                            .onTapGesture {
                                self.press.toggle()
                            }
                    }
                    
                }
                    
            }
            
        }
        
            
            //.background(Color.white).frame(height: .infinity).ignoresSafeArea(.all)
         
        //.background(Color.white).frame(height: .infinity).ignoresSafeArea(.all)
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
        
    }
}

struct PlanEditView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlanEditView(namespace: namespace, show: .constant(true))
    }
}
