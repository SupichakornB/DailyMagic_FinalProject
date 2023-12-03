//
//  cal.swift
//  final
//
//  Created by Supichakorn Boonkasem on 1/12/2566 BE.
//

import SwiftUI


struct cal: View {
    @State private var checkTotal = ""
    @State private var color: Color = Color.pink
    @State private var unit1:String = "unit ▼"
    
    @State private var value1 = ""
    @State private var price1 = ""
    @State private var value2 = ""
    @State private var price2 = ""

    var body: some View {
        VStack {
        
            ZStack {
                Text("CALCULATOR").font(.custom("KumoThin", size: 32)).fontWeight(.heavy).foregroundColor(Color(hue: 0.107, saturation: 0.726, brightness: 0.826)).position(x: 195, y: 30).shadow(radius: 1.3)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 370, height: 320)
                    .foregroundStyle(Color(hue: 0.905, saturation: 0.163, brightness: 1.0))
                    .opacity(0.8)
                    .shadow(radius: 6)
                    .position(x: 197, y: 375)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 360, height: 120)
                        .foregroundStyle(Color(hue: 0.126, saturation: 0.442, brightness: 1.0))
                        .position(x: 200, y: 140)
                        .shadow(radius: 3)
                    
                    Image("budg")
                        .resizable()
                        .frame(width: 270, height: 270)
                        .position(CGPoint(x: 150.0, y: 118))
                    
                    ZStack {
                       
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hue: 0.605, saturation: 0.0, brightness: 1.0))  // Set the background color to white
                            .frame(width: 238, height: 80)
                            .position(x: 230, y: 125)
                            .padding()
                        
                        Text("THB")
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.077, saturation: 0.414, brightness: 0.607))
                               .padding()
                               .position(x: 168, y: 125)
                               .font(.system(size: 24))
                               .opacity(0.5)

                           TextField("000", text: $checkTotal)
                               .multilineTextAlignment(.trailing)
                               .foregroundColor(Color(hue: 1.0, saturation: 0.217, brightness: 0.292))
                               .keyboardType(.decimalPad)
                            .position(x: 150, y: 145)
                   
                            .font(.system(size: 50))
                            

                    }
                    ZStack{
//                       Circle()
//                            .frame(width: 360, height: 100)
//                            .foregroundStyle(Color(hue: 0.148, saturation: 0.033, brightness: 1.0))
//                            .position(x: 70, y: 275)
                         
                        
                        Image("cart1")
                            .resizable()
                            .frame(width: 160, height: 160)
                            .position(CGPoint(x: 68, y: 282))
                        
//                        Circle()
//                             .frame(width: 360, height: 100)
//                             .foregroundStyle(Color(hue: 0.148, saturation: 0.033, brightness: 1.0))
//                             .position(x: 70, y: 390)
//                          
                         
                         Image("cart2")
                             .resizable()
                             .frame(width: 160, height: 160)
                             .position(CGPoint(x: 68, y: 397))
                        
                        HStack{
                            TextField("0", text: $value1)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.217, brightness: 0.292))
                                .background(Color(red: 33, green: 44, blue: 66)).frame(width: 160).clipShape(RoundedRectangle(cornerRadius: 15))
                                .keyboardType(.decimalPad)
                             .position(x: 210, y: 255)
                             .font(.system(size: 30))
                             .shadow(radius: 2)
                            
                            Menu{
                                Button(action: {unit1="ML."}, label:{ Text("ML.")})
                                Button(action: {unit1="L."}, label:{ Text("L.")})
                                Button(action: {unit1="G.."}, label:{ Text("G.")})
                                Button(action: {unit1="KG."}, label:{ Text("KG.")})
                                Button(action: {unit1="OZ."}, label:{ Text("OZ.")})
                                Button(action: {unit1="LB."}, label:{ Text("LB.")})
                                
                            } label: {
                                
                                Label(
                                    title: {Text(unit1).foregroundStyle(Color(white: 12)).shadow(radius: 3).font(.system(size: 24))},
                                    icon: {  }
                                )
                            }.position(x: 130, y: 255)
                            
                
                        }
                        
                       
                        
                        TextField("0", text: $price1)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.217, brightness: 0.292))
                            .background(Color(red: 33, green: 44, blue: 66)).frame(width: 235).clipShape(RoundedRectangle(cornerRadius: 15))
                            .keyboardType(.decimalPad)
                         .position(x: 245, y: 300)
                         .font(.system(size: 30))
                         .shadow(radius: 2)
                        
                        Text("THB")
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.077, saturation: 0.414, brightness: 0.607))
                               .padding()
                               .position(x: 158, y: 295)
                               .font(.system(size: 14))
                               .opacity(0.5)
                        
                        
                        TextField("0", text: $value2)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.217, brightness: 0.292))
                            .background(Color(red: 33, green: 44, blue: 66)).frame(width: 160).clipShape(RoundedRectangle(cornerRadius: 15))
                            .keyboardType(.decimalPad)
                         .position(x: 213, y: 365)
                         .font(.system(size: 30))
                         .shadow(radius: 2)
                        
                        Menu{
                            Button(action: {unit1="ML."}, label:{ Text("ML.")})
                            Button(action: {unit1="L."}, label:{ Text("L.")})
                            Button(action: {unit1="G.."}, label:{ Text("G.")})
                            Button(action: {unit1="KG."}, label:{ Text("KG.")})
                            Button(action: {unit1="OZ."}, label:{ Text("OZ.")})
                            Button(action: {unit1="LB."}, label:{ Text("LB.")})
                            
                        } label: {
                            
                            Label(
                                title: {Text(unit1).foregroundStyle(Color(white: 12)).shadow(radius: 3).font(.system(size: 24))},
                                icon: {  }
                            )
                        }.position(x: 330, y: 365)
                        
            
                    }
                    
                   
                    
                    TextField("0", text: $price2)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.217, brightness: 0.292))
                        .background(Color(red: 33, green: 44, blue: 66)).frame(width: 235).clipShape(RoundedRectangle(cornerRadius: 15))
                        .keyboardType(.decimalPad)
                     .position(x: 248, y: 410)
                     .font(.system(size: 30))
                     .shadow(radius: 2)
                    
                    Text("THB")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.077, saturation: 0.414, brightness: 0.607))
                           .padding()
                           .position(x: 158, y: 405)
                           .font(.system(size: 14))
                           .opacity(0.5)
                    }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 70)
                    .foregroundStyle(Color(hue: 0.001, saturation: 0.652, brightness: 1.0))
                    .shadow(radius: 5)
                    .position(x: 200, y: 485)
                    }
                }
            }
        }
    


#Preview {
    cal()
}
