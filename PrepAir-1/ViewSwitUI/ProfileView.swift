//
//  ProfileView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var showParking = false

    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
                VStack(spacing: 0){
                    ProfileHeaderView()
                    HStack {
                        Image("Parking")
                            .padding(10)
                            .padding([.leading, .top])
                            .onTapGesture{
                                showParking.toggle()
                            }
                      Spacer()
                        Image("Shopping")
                            .padding(10)
                            .padding([.leading, .top])
                      Spacer()
                        Image("Trips")
                            .padding(10)
                            .padding([.leading, .top])
                      Spacer()
                    }
                   
                   
                        
                  
                    HStack{
                        Image("ProfileDetails")
                    }
            }.offset(y:-80)
            
        }.ignoresSafeArea(.all)
            .overlay(RootHomeView())

        
        if showParking{
            if #available(iOS 16.0, *) {
                ParkingMainView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
    
}
