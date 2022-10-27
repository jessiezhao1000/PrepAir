//
//  RootView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI


struct RootView: View {
    @State var showMap = false
    @State var showHome = false
    var body: some View {
        
            VStack {
                
                Spacer()
                ZStack {
                    Image("tab bar")
                    HStack(alignment: .bottom, spacing: 75) {
                        Image("flight takeoff").onTapGesture{
                            showHome.toggle()
                        }
                        Image("Map").onTapGesture {
                            showMap.toggle()
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

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
