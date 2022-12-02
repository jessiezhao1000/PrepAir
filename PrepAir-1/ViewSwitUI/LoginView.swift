//
//  LoginView.swift
//  PrepAir-1
//
//  Created by Yiwen Zhao on 12/1/22.
//

import SwiftUI

/*
struct UserName {
    @Binding static var userName: String
    //static var globalName = userName
}
*/

struct LoginView: View {
    @State var userName: String = ""
    @State var finished = false
    
    var body: some View {
        ZStack {
            //Login
            //Rectangle 1
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
                .frame(width: 393, height: 852)
                .ignoresSafeArea()
            
            VStack {
                /*
                Text("Welcome to")
                    .foregroundColor(.white)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    //.frame(maxWidth: .infinity, alignment: .leading)
                 */
                Text("Prep")
                    .foregroundColor(.white)
                    .font(.system(size:64))
                    .fontWeight(.bold) +
                Text("Air")
                    .foregroundColor(.white)
                    .font(.system(size:64))
                    .fontWeight(.light)
                    
                Spacer()
                TextField("What is your name?", text: $userName)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .disableAutocorrection(true)
                    .onSubmit {
                        finished.toggle()
                    }
                /*
                Text("What is your name?")
                    .foregroundColor(.white)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                 */
                /*
                TextField("What is your name?", text: $userName)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //.onSubmit {
                      //  HomeView()
                    //}
                 */
                Spacer()
                Spacer()
            }.padding(.all, 100)
            if finished {
                //HeaderView(userName: $userName)
                HomeView(userName: $userName)
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


struct LoginView_Previews: PreviewProvider {
    //@State static var userName: String = ""
    static var previews: some View {
        LoginView()
        //userName(userName: $userName)
    }
}

