//
//  HeaderView.swift
//  PrepAir-1
//
//  Created by Yiwen Zhao on 11/7/22.
//

import SwiftUI

struct HeaderView: View {
    @State var text = ""
    @State var isBegin = false
    @State private var calander = Date()
    @State var showDatePicker = false

    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
                .frame(width: 400, height: 260)
            
            VStack {
                //Welcome, Yiqian
                Text("Welcome, ")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 50)
                
                Text("Yiqian")
                    .font(.system(size: 40))
                    .fontWeight(.regular)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                
                //Rectangle 4
                HStack {
                    /*
                     RoundedRectangle(cornerRadius: 25)
                     .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                     .frame(width: 247, height: 40)
                     .padding([.leading])
                     */
                    
                    TextField("Select your flight", text: $text, onEditingChanged: { (editting) in
                        self.showDatePicker = editting
                    })
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.leading)
                    .onTapGesture {
                        print("work?") // how to detect if a user has tap onto the text field?
                    }
                    
                    
                    Spacer()
                    //Rectangle 4
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(width: 79, height: 40)
                        .padding(.trailing)
                    
                    if self.showDatePicker {
                        DatePicker("Date", selection: $calander, in: Date()..., displayedComponents: .date)
                    }
                    
                }
                
                
            }
        }
    }
    
    struct OvalTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(10)
            //.background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .background(.white)
                .cornerRadius(20)
                .frame(width: 247, height: 40)
            //.shadow(color: .gray, radius: 10)
        }
    }
    
    struct HeaderView_Previews: PreviewProvider {
        static var previews: some View {
            HeaderView()
        }
    }
}
