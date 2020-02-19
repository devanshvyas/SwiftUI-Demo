//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by Devansh Vyas on 07/12/19.
//  Copyright © 2019 Solution Analysts. All rights reserved.
//

import SwiftUI

let baseGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.6, blue: 0.5), Color(red: 0.2, green: 0.4, blue: 0.6)]), startPoint: .top, endPoint: .bottom)

let backgroundColor = LinearGradient(gradient: Gradient(colors: [Color(red: 0.5, green: 0.9, blue: 0.8), .white]), startPoint: .top, endPoint: .bottom)


struct ContentView: View {
    @State var selection: Int? = 0
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    HeaderTitle()
                    Spacer()
                    RoundedImageView()
                    NavigationLink(destination: SignUpView(), isActive: $isActive) {
                        RoundedButton(text: "Sign Up", action: {
                            self.isActive = true
                        })
                    }
//                    NavigationLink(destination: SignUpView()) {
//
//                    }
                            .padding(.horizontal, 20.0)
                            .padding(.top, 50)
                    NavigationLink(destination: LoginView(), tag: 1, selection: $selection) {
                        RoundedButton(text: "Login", action: {
                            self.selection = 1
                        })
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                    }
                }.padding(.bottom, 200)
            }
            onAppear() {
                self.isActive = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedButton: View {
    let text: String
    let action: (()->Void)
    var body: some View {
        Button(action:
            self.action
        ) {
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(Font.system(size: 20))
                .multilineTextAlignment(.center)
                .frame(height: 50.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(baseGradient)
                .border(baseGradient, width: 2)
                .cornerRadius(30)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(baseGradient, lineWidth: 3)
            )
        }
        
    }
}

struct HeaderTitle: View {
    var body: some View {
        Text("SwiftUI Demo")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
            .padding(.top, 70)
    }
}

struct RoundedImageView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 76)
            .frame(width: 152.0, height: 152.0)
            .overlay(
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100))
            .background(baseGradient)
            .foregroundColor(.clear)
            .clipShape(Circle())
    }
}
