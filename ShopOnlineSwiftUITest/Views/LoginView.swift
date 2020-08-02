//
//  LoginView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 17/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                        ZStack {
            //                RadialGradient(gradient: Gradient(colors: [.gray, .white]), center: .center, startRadius: 2, endRadius: 2000)
                            VStack(spacing: 15) {
                                Text("Login")
                                    .padding(.top, 50)
                                    .font(.system(size: 25, weight: .bold))
                                Spacer()
                                TextField("Email", text: .constant(""))
                                    .padding()
                                    .background(Color("flash-white"))
                                    .cornerRadius(4.0)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                                    .keyboardType(UIKeyboardType.emailAddress)
                                SecureField("Password", text: .constant("Password"))
                                    .padding()
                                    .background(Color("flash-white"))
                                    .cornerRadius(4.0)
                                    .padding(.bottom, 10)
                                NavigationLink(destination: ProductsView()) {
                                    Text("Sign In")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.green)
                                        .cornerRadius(15.0)
                                }
                                Spacer()
                            }.padding([.leading, .trailing], 27.5)
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            
                        }.edgesIgnoringSafeArea(.all)
                    }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



