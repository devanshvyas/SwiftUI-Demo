//
//  LoginView.swift
//  SwiftUI-Demo
//
//  Created by Devansh Vyas on 10/12/19.
//  Copyright © 2019 Solution Analysts. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var user: User = User(name: "", phoneNumber: "", email: "")
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderTitle()
                VStack {
                    RoundedImageView()
                        .padding(50)
                    RoundedTextField(value: $user.email,placeholder: "Email:")
                    RoundedTextField(value: $password,placeholder: "Password:")
                    Spacer()
                    RoundedButton(text: "Login", action: {
                        print(self.$user.name.wrappedValue)
                    }).padding([.bottom, .horizontal], 60)
                }
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
