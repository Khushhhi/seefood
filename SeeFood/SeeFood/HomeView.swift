
import SwiftUI

struct HomeView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    @State private var showClassification: Bool = false
    @State private var classificationLabel: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Text("SEEFOOD")
                    .font(.largeTitle)
                    .frame(height: 200)
                    .background(Color(.red))
                    .padding()
                
                Spacer()
                
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Text("Touch to SEEFOOD")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                }
                Spacer()
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: processImage) {
                ImagePicker(image: self.$inputImage)
            }
            .alert(isPresented: $showClassification) {
                Alert(
                    title: Text(classificationLabel),
                    message: Text("Would you like to try another image?"),
                    dismissButton: .default(Text("OK")) {
                        self.inputImage = nil
                        self.showClassification = false
                    }
                    
                    
                )
            }
        }
    }
    
    func processImage() {
        guard let inputImage = inputImage else { return }
        
        // TODO: Use inputImage with the CoreML model here
        
        self.classificationLabel = "Hotdog"
        self.showClassification = true
    }
}

//struct HomeView_Previews: PreviewProvider {
//
//}
#Preview {
    HomeView()
}
