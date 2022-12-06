//
//  RootProfileView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 12/1/22.
//

import SwiftUI

struct RootProfileView: View {
    @State private var showMap = false
    @State private var showHome = false
    @State private var showProfile = false
    @Binding var userName: String
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                //Rectangle 3
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.8458333611488342, green: 0.8458333611488342, blue: 0.8458333611488342, alpha: 1)))
                    .frame(width: 400, height: 103)
                
                HStack(alignment: .bottom, spacing: 75) {
                        Image("flight takeoff").onTapGesture{
                            showHome.toggle()
                            //showFlightIcon.toggle()
                            //showMapIcon.toggle()
                        }
                        Image("Map").onTapGesture {
                            showMap.toggle()
                            //showFlightIcon.toggle()
                            //showMapIcon.toggle()
                        }
                    Image("BlueProfile").onTapGesture{
                        showProfile.toggle()
                    }
                   
                }.offset(y : -7)
            }
      
        }.ignoresSafeArea()
    
    if showMap{
        MapView(userName: $userName)
    }
    if showHome{
        HomeView(userName: $userName)
    }
    if showProfile{
        ProfileView(userName: $userName)
    }
}
}

struct RootProfileView_Previews: PreviewProvider {
    @State static var userName: String = ""
    static var previews: some View {
        RootProfileView(userName: $userName)
    }
}
