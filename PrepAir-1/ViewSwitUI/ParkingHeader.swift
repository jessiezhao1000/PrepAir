//
//  ParkingHeader.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

struct ParkingHeader: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
            .frame(width: 400, height: 260)
            
            VStack {
                //Welcome, Yiqian
                Text("Parking")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
            }
            
            
        }
    
    }
}

struct ParkingHeader_Previews: PreviewProvider {
    static var previews: some View {
        ParkingHeader()
    }
}
