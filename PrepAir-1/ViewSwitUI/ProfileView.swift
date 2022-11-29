//
//  ProfileView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
                VStack(spacing: 0){
                    ProfileHeaderView()
                    HStack {
                        Image("Parking")
                            .padding(10)
                            .padding([.leading, .top])
                        Spacer()
                       

                    }
                    Text("Parking")
                        .font(.body)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                    Spacer()
            }
            
        }.ignoresSafeArea(.all)
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
