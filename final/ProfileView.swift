import SwiftUI

class ShareddataViewModel: ObservableObject {
    @Published var isRandomMenViewActive: Bool = false
    @Published var isRandomWomenViewActive: Bool = false
    @Published var randomMenImageName: String? = "menblank"
    @Published var randomWomenImageName: String? = "womenblank"
    @Published var menName: String = "Men Name"
    @Published var womenName: String = "Women Name"
}

struct ProfileView: View {
    @EnvironmentObject var sharedData: ShareddataViewModel
    @State private var menar: [String] = []
    @State private var womenar: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                // Men Section
                VStack {
                    TextField("Men Name", text: $sharedData.menName)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).background(Color(red: 138/255, green: 205/255, blue: 215/255)).foregroundStyle(Color(red: 138/255, green: 205/255, blue: 215/255))
                        .padding()

                    Button("Random Men") {
                        // Randomly select image of men
                        if let randomMenImageName = menar.randomElement() {
                            sharedData.randomMenImageName = randomMenImageName
                        }
                        sharedData.isRandomMenViewActive = true
                        sharedData.isRandomWomenViewActive = false
                    }.foregroundStyle(Color(red: 138/255, green: 205/255, blue: 215/255))

                    if let randomMenImageName = sharedData.randomMenImageName {
                        Image(randomMenImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(80)
                    }
                }

                // Women Section
                VStack {
                    TextField("Women Name", text: $sharedData.womenName)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).background(Color(red: 255/255, green: 144/255, blue: 188/255)).foregroundStyle(Color(red: 255/255, green: 144/255, blue: 188/255))
                        .padding()

                    Button("Random Women") {
                        // Randomly select image of women
                        if let randomWomenImageName = womenar.randomElement() {
                            sharedData.randomWomenImageName = randomWomenImageName
                        }
                        sharedData.isRandomWomenViewActive = true
                        sharedData.isRandomMenViewActive = false
                    }.foregroundStyle(Color(red: 255/255, green: 144/255, blue: 188/255))

                    if let randomWomenImageName = sharedData.randomWomenImageName {
                        Image(randomWomenImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(80)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                loadMenImages()
                loadWomenImages()
            }
        }
    }

    func loadMenImages() {
        if let url = Bundle.main.url(forResource: "men", withExtension: "plist"),
           let testData = try? Data(contentsOf: url),
           let menPlist = try? PropertyListSerialization.propertyList(from: testData, options: [], format: nil) as? [String] {
            menar = menPlist
        }
    }

    func loadWomenImages() {
        if let url = Bundle.main.url(forResource: "women", withExtension: "plist"),
           let testData = try? Data(contentsOf: url),
           let womenPlist = try? PropertyListSerialization.propertyList(from: testData, options: [], format: nil) as? [String] {
            womenar = womenPlist
        }
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
