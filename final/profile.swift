//
//  profile.swift
//  final
//
//  Created by Supichakorn Boonkasem on 3/12/2566 BE.
//

import SwiftUI

struct profile: View {
    @State var shouldShowImagePicker = false
    @State var shouldShowImagePicker2 = false
    @State var image: UIImage?
    @State var image2: UIImage?
    @State private var editingName = false
    @State private var editingName2 = false
    @State private var name_m = "Your Boy"
    @State private var name_fm = "Your Girl"

    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("CALCULATOR").font(.custom("KumoThin", size: 32)).fontWeight(.heavy).foregroundColor(Color(hue: 0.107, saturation: 0.726, brightness: 0.826))/*.position(x: 195, y: 30).shadow(radius: 1.3)*/
                
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(Color(hue: 0.532, saturation: 0.096, brightness: 0.999))
                         //   .edgesIgnoringSafeArea(.top)
                            .frame(height: 360)
                        
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 143, height: 143)
                                        .cornerRadius(80).position(x:200, y: 145)
                                } else {
                                    Image("editprofile")
                                        .resizable().frame(width: 80, height: 80).position(x:180, y: 130)
                                        .padding()
                                        .foregroundColor(Color(.brown))
                                        .overlay(RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color.black, lineWidth: 3).frame(width: 200, height: 200).position(x:196, y: 145)
                                
                            
                        
                                                 )}
                                                 
                                //  Spacer()
                                
                                Button(action: {
                                    editingName.toggle()
                                }) {
                                    Image("editname").resizable().frame(width: 25, height: 25)
                                }
                                .position(x: -3, y: 320)
                            }
                        
                        VStack(spacing: 5) {
                            if editingName {
                                TextField("Enter name", text: $name_m)
                                    .multilineTextAlignment(.center).font(.custom("KumoThin", size: 20))
                                    .padding()
                            } else {
                                Text(name_m)
                                    .bold()
                                    .font(.custom("KumoThin", size: 20))
                            }}
                        
                        .padding().position(x: 195, y: 280)
                        
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(hue: 0.894, saturation: 0.078, brightness: 1.0))
                             //   .edgesIgnoringSafeArea(.bottom)
                                .frame(height: 390).position(x: 197, y: 568)
                            
                            Button {
                                shouldShowImagePicker2.toggle()
                            } label: {
                                VStack {
                                    if let image2 = self.image2 {
                                        Image(uiImage: image2)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 143, height: 143)
                                            .cornerRadius(80).position(x:182, y: 370)
                                    } else {
                                        Image("editprofile")
                                            .resizable().frame(width: 80, height: 80).position(x:180, y: 510)
                                            .padding()
                                            .foregroundColor(Color(.brown))
                                    }
                                }
                                .overlay(RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.black, lineWidth: 3).frame(width: 200, height: 200).position(x:196, y: 525)
                                )
                                
                                    //  Spacer()
                                    
                                    Button(action: {
                                        editingName2.toggle()
                                    }) {
                                        Image("editname").resizable().frame(width: 25, height: 25)
                                    }
                                    .position(x: -3, y: 700)
                                }
                            
                            VStack(spacing: 5) {
                                if editingName2 {
                                    TextField("Enter name2", text: $name_fm).font(.custom("KumoThin", size: 20))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                } else {
                                    Text(name_fm)
                                        .bold()
                                        .font(.custom("KumoThin", size: 20))
                                }}
                            
                            .padding().position(x: 195, y: 660)
                            
                        }
                        
                   
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                //        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                //
                //                            ImagePicker(image: $image)
                //                                .ignoresSafeArea()
                //        }
            }
        }
    }
}
#Preview {
    profile()
}
