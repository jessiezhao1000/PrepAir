//
//  RootView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI


struct RootHomeView: View {
    @State private var showMap = false
    @State private var showHome = false
    
    //@State private var showFlightIcon = true
    //@State private var showMapIcon = false
    
    var body: some View {
            VStack {
                Spacer()
                ZStack {
                    //Rectangle 3
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8458333611488342, green: 0.8458333611488342, blue: 0.8458333611488342, alpha: 1)))
                        .frame(width: 400, height: 103)
                    
                    HStack(alignment: .bottom, spacing: 75) {
                            Image("flight takeoff selected").onTapGesture{
                                showHome.toggle()
                                //showFlightIcon.toggle()
                                //showMapIcon.toggle()
                            }
                            Image("Map").onTapGesture {
                                showMap.toggle()
                                //showFlightIcon.toggle()
                                //showMapIcon.toggle()
                            }
                            Image("Vector-1")
                       
                    }.offset(y : -7)
                }
          
            }.ignoresSafeArea()
        
        if showMap{
            MapView()
        }
        if showHome{
            HomeView()
        }
    }
}

struct RootHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RootHomeView()
    }
}