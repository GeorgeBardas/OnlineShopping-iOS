//
//  ContentView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 12/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let coloredNavAppearance = UINavigationBarAppearance()
    
//    init() {
//        UITabBar.appearance().color = UIColor.black
//    }
    
    let mainApp : some View =
        TabView {
           ProductsView()
             .tabItem {
                Image(systemName: "house")
                Text("Home")
              }
            
            CategoriesView()
            .tabItem {
               Image(systemName: "square")
               Text("Categories")
             }
            
            BagView()
            .tabItem {
               Image(systemName: "bag")
               Text("Bag")
             }
            
            FavoritesView()
            .tabItem {
               Image(systemName: "suit.heart")
               Text("Favorites")
             }
            
            ProfileView()
            .tabItem {
               Image(systemName: "person")
               Text("My Profile")
             }
        }
        .accentColor(.black)
    
    let loginScreen = LoginView()
    
    var body: some View {
        if true {
            return AnyView(mainApp)
        } else {
            return AnyView(ContentView())
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
