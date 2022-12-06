//
//  ProfileView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var showParking = false
    @Binding var userName: String
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
                VStack(spacing: 0){
                    ZStack {
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
                        .frame(width: 400, height: 260)
                        
                        VStack {
                            Image("Vector-1").resizable().scaledToFit()
                                .padding(.top)
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(userName)
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .frame(maxWidth: .infinity, alignment: .center)
                                //.padding([.bottom])
                        }
                      
                        
                    }
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
            RootProfileView(userName: $userName)
        }.ignoresSafeArea(.all)

        if showParking{
            if #available(iOS 16.0, *) {
                ParkingMainView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        @State static var userName: String = ""
        static var previews: some View {
            ProfileView(userName: $userName)
        }
    }
    
}
