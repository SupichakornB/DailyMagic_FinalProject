//
//  login.swift
//  final
//
//  Created by Supichakorn Boonkasem on 3/12/2566 BE.
//

import SwiftUI
import FirebaseAuth

    struct login: View {
        @Binding var currentShowingView: String
        @AppStorage("uid") var userID: String = ""
        
        
        @State private var email: String = ""
        @State private var password: String = ""
        
        
        
        private func isValidPassword(_ password: String) -> Bool {
            // minimum 6 characters long
            // 1 uppercase character
            // 1 special char
            
            let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&._-])(?=.*[A-Z]).{6,}$")
            
            return passwordRegex.evaluate(with: password)
        }
        
        var body: some View {
            NavigationStack{
            ZStack {
              //  Color(red: 252/255, green: 216/255, blue: 212/255)
                    
                AngularGradient(colors: [Color(red: 252/255, green: 216/255, blue: 212/255), Color(red: 255/255, green: 189/255, blue: 247/255)], center: .topLeading, startAngle: .degrees(27), endAngle: .degrees(65)).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Dairy Magic!")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "mail")
                        TextField("Email", text: $email)
                        
                        Spacer()
                        
                        
                        if(email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                        
                    )
                    
                    .padding()
                    
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                        
                        Spacer()
                        
                        if(password.count != 0) {
                            
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                        
                    )
                    .padding()
                    
                    
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "signup"
                        }
                        
                        
                    }) {
                        Text("Don't have an account?")
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: home()) {
                                           EmptyView()
                                       
                                       .hidden()

                                       Button {
                                           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                               if let error = error {
                                                   print(error)
                                                   return
                                               }

                                               if let authResult = authResult {
                                                   print(authResult.user.uid)
                                                   withAnimation {
                                                       userID = authResult.user.uid
                                                       currentShowingView = "home"
                                                   }
                                               }
                                           }
                                       } label: {
                                           Text("Sign In")
                                               .foregroundColor(.white)
                                               .font(.title3)
                                               .bold()
                                               .frame(maxWidth: .infinity)
                                               .padding()
                                               .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.black)
                                               )
                                               .padding(.horizontal)
                                       }
                                       }
                                   }
                               }
                           }
                       }
                   }




