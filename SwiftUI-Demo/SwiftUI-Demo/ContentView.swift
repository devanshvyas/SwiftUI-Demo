//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by Devansh Vyas on 07/12/19.
//  Copyright © 2019 Solution Analysts. All rights reserved.
//

import SwiftUI

let baseGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.6, blue: 0.5), Color(red: 0.2, green: 0.4, blue: 0.6)]), startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.9, blue: 0.8).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center) {
                Text("SwiftUI Demo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.601, saturation: 0.908, brightness: 0.823))
                    .padding(.top, 70)
                Spacer()
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
                RoundedButton(text: "Sign Up")
                    .padding(.horizontal, 20.0)
                    .padding(.top, 50)
                RoundedButton(text: "Login")
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
            }.padding(.bottom, 200)
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
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(baseGradient)
            .frame(height: 50.0)
            .foregroundColor(.white)
            .overlay(
                Button(action: {}) {
                    Text(text).foregroundColor(.white)
            })
    }
}
