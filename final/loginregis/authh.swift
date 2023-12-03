//
//  auth.swift
//  final
//
//  Created by Supichakorn Boonkasem on 3/12/2566 BE.
//

import SwiftUI

struct authh: View {
    @State private var currentViewShowing: String = "login" // login or signup
        
    var body: some View {
        
        if(currentViewShowing == "login") {
            login(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            register(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
  
    }
}

struct auth_Previews: PreviewProvider {
    static var previews: some View {
        authh()
    }
}
