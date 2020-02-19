//
//  SignUpView.swift
//  SwiftUI-Demo
//
//  Created by Devansh Vyas on 10/12/19.
//  Copyright © 2019 Solution Analysts. All rights reserved.
//

import SwiftUI

struct User {
    var name: String
    var phoneNumber: String
    var email: String
}

struct SignUpView: View {
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
                    RoundedTextField(value: $user.name,placeholder: "Full name:")
                    RoundedTextField(value: $user.phoneNumber,placeholder: "Phone Number:")
                    RoundedTextField(value: $user.email,placeholder: "Email:")
                    RoundedTextField(value: $password,placeholder: "Password:")
                    Spacer()
                    RoundedButton(text: "Sign Up", action: {
                        print(self.$user.name.wrappedValue)
                    }).padding([.bottom, .horizontal], 60)
                }
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct RoundedTextField: View {
    @Binding var value: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 40)
            .padding(.all, 5)
            .padding(.horizontal, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(baseGradient, lineWidth: 2)
                    .padding(.horizontal, 10)
                
        )
            .padding(.bottom, 10)
            .padding(.horizontal, 5)
    }
}
