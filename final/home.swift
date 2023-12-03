//
//  ContentView.swift
//  final
//
//  Created by Supichakorn Boonkasem on 1/12/2566 BE.
//

import SwiftUI

struct home: View {
    var body: some View {
        TabView {
            homeview()
                .tabItem { Label("Home", systemImage: "house") }
            
            
            cal()
                .tabItem { Label("Calculate", image: "calicon")
            }.imageScale(.small)
            
            
         //   map().tabItem { Label("Map", image: "mapicon") }
          
            
            profile()
                .tabItem { Label("Profile",  image: "noteicon") }
          
        }
    }
}

#Preview {
    home()
}
