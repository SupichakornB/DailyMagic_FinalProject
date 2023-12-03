//
//  homeview.swift
//  final
//
//  Created by Supichakorn Boonkasem on 3/12/2566 BE.
//

import SwiftUI
import GRDB

struct homeview: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var places: [Place] = []
   // var Type:String=""
    
    var cafename:[String]=[]
    var cafelatitude:[Double]=[]
    var cafelongtitude:[Double]=[]
    var caferating:[Double]=[]
    var cafereview:[String]=[]
    var cafepicname:[String]=[]
    var cafeid:[Int]=[]
    
    private let categories = ["All", "Cafe", "Restaurant", "Museum", "Park"]
    
    var dbPath: String = ""
       var dbResourcePath: String = ""
       var config = Configuration()
       let fileManager = FileManager.default

    
    
    
    struct Place: FetchableRecord {
        var name: String
        var latitude: Double
        var longitude: Double
        var rating: Double
        var review: String
        var picName: String
        var id: Int
        
        init(row: Row) {
            name = row["name"]
            latitude = row["latitude"]
            longitude = row["longitude"]
            rating = row["rating"]
            review = row["review"]
            picName = row["picname"]
            id = row["id"]
        }
    }

    var body: some View {

        NavigationView {
            ZStack {
                Color(red: 253/255, green: 226/255, blue: 244/255)
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categories.indices) { i in
                                    Button(action: { selectedIndex = i }) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<places.count) { i in
                                    Button(action: { selectedIndex = i }) {
                                        CategoryView(isActive: selectedIndex == i, text: cafename[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        
                        Text("Bangkok")
                            .font(.custom("KumoThin", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    locationView(image: Image("chair_\(4-i)"), size: 180)
                                    //  Text(cafename[i])
                                }
                                .padding(.leading)
                            }
                        }
                        
                        //เรียงหมวดหมู่
                        
                        
                        Text("Nonthaburi")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    locationView(image: Image("chair_\(4-i)"), size: 180)
                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
            }
        }
//        .onAppear{
//            connect2DB()
//        }
    }
    
    init() {
            connectDB()
            readDB()
        }

    
    private mutating func connectDB(){
        config.readonly = true  //อ่านอย่างเดียว  // ถ้า insert ต้องเปลี่ยนเปน fault
        do{
         dbPath = try fileManager
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("rv.db")  //เปลี่ยนเปนชื่อ database
            .path
            if !fileManager.fileExists(atPath: dbPath) {
                try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
            }
        }catch{
            print("An error has occured")
        }
      }    
    mutating func readDB(){
        connectDB()
        
          do {
              let dbQueue = try DatabaseQueue(path: dbPath, configuration: config)

              try dbQueue.inDatabase { db in
                  let rows = try Row.fetchCursor(db, sql: "SELECT name FROM cafe")
                  while let row = try rows.next() {
                      cafename.append(row["name"])
                  }
              }
          } catch {
              print(error.localizedDescription)
          }
          
      }

    
    
}

#Preview {
    homeview()
}






extension DatabaseQueue {
    static var shared: DatabaseQueue = {
        // Use your own path to the SQLite database file
        let databaseURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("rv.db")
        return try! DatabaseQueue(path: databaseURL.path)
    }()
}



struct TagLineView: View {
    var body: some View {
        Text("Dating with your comfort \n")
            .font(.custom("Kumothin", size: 24))
            .foregroundStyle(.black)
            + Text("LOVE !")
            .font(.custom("PlayfairDisplay-Bold", size: 48))
            .fontWeight(.bold)
            .foregroundStyle(.brown)
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(Color(hue: 0.057, saturation: 0.468, brightness: 0.35))
                .foregroundStyle(.blue)
            if (isActive) { Color("Primary")
                .frame(width: 18, height: 3)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct locationView: View {
    let image: Image
    let size: CGFloat
    let mg=homeview().cafename
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("abc").font(.title3).fontWeight(.bold)
//            ForEach(0 ..< 4) { i in
//             
//                Text(mg[i]).font(.title3).fontWeight(.bold)
//            }
            
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 2)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}




struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
