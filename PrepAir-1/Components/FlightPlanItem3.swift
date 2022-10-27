//
//  FlightPlanItem.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/31/22.
//

import SwiftUI

struct FlightPlanItem3: View {
    //var namespace: Namespace.ID
    //@Binding var show: Bool
    
    var body: some View {
        ZStack {
            //Rectangle 5
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(#colorLiteral(red: 0.9416666626930237, green: 0.9416666626930237, blue: 0.9416666626930237, alpha: 1)))//.matchedGeometryEffect(id: "card", in: namespace)
                .frame(width: 196, height: 218)
                //.matchedGeometryEffect(id: "frame", in: namespace)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 10, x: 0, y: 4)
                //.matchedGeometryEffect(id: "rectangle", in: namespace)
            
            Image("Add-1")
               
            }

        }
    
}

struct FlightPlanItem3_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        //FlightPlanItem2(namespace: namespace, show: .constant(true))
        FlightPlanItem3()
    }
}
