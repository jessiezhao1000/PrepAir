//
//  NameGetter.swift
//  PrepAir-1
//
//  Created by Yiwen Zhao on 12/1/22.
//
/*
import SwiftUI

struct NameGetter: View {
    @State var userName: String = ""
    @State var finished = false
    
    var body: some View {
        TextField("What is your name?", text: $userName)
            .textFieldStyle(OvalTextFieldStyle())
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .disableAutocorrection(true)
            .onSubmit {
                finished.toggle()
            }
        if finished {
            HomeView()
        }
    }
    
}
/*
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
*/
struct NameGetter_Previews: PreviewProvider {
    static var previews: some View {
        NameGetter()
    }
}

*/
