//
//  HomeView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    
    @State private var contentOffset = CGFloat(0)
    @State var focusModeShow = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            TrackableScrollView(offsetChanged: { offsetHome in
                contentOffset = offsetHome.y
                print("contentOffset", contentOffset)
                if contentOffset > 100 {
                    withAnimation {
                        focusModeShow = true
                        //homeViewShow = false
                    }
                    
                }
            }) {
                VStack(spacing: 0) {
                    //Image("Head")
                    //FocusModeView()

                    HeaderView()
                        .offset(y:-75)
                        .frame(height:260)
                        
                    Text("Your Plans")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            if !show {
                                FlightPlanItem(namespace: namespace, show: $show)
                                    .padding()
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                            show.toggle()
                                        }
                                    }
                            }
                            //Image("LAX to ATL")
                            FlightPlanItem2()
                                .padding()
                            FlightPlanItem3()
                                .padding()
                               
                            
                        }
                    }
                    
                    Text("Predicted Time")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                    
                    
                    Image("Predicted Time")
                        .padding(.bottom, 100)
                    
                    Spacer()
                }
               
            }
            .ignoresSafeArea(.all)
            .overlay(RootHomeView())
            if show {
                //withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    PlanEditView(namespace: namespace, show: $show)
                        //.ignoresSafeArea(.all)
                //}
                
            }
            if focusModeShow {
                FocusModeView()
            }
        }.frame(width: 400, height: 800)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
