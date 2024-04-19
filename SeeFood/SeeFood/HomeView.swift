
import SwiftUI
import CoreML
import Vision

struct HomeView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    @State private var showClassification: Bool = false
    @State private var classificationLabel: String = ""
    let model = SeeFoodModel()
    var body: some View {
        NavigationView {
            VStack{
                Text("SEEFOOD")
                    .font(.largeTitle)
                    .frame(width: 500, height: 100)
                    .background(Color(#colorLiteral(red: 0.9309574962, green: 0.6133975387, blue: 0.6495192647, alpha: 1)))
                    .padding()
                    .edgesIgnoringSafeArea(.top)
                
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
//            .sheet(isPresented: $showImagePicker, onDismiss: processImage) {
//                ImagePicker(image: self.$inputImage)
//            }
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
        .edgesIgnoringSafeArea(.all)
    }
    
//    func processImage() {
//        guard let inputImage = inputImage else { return }
//
//        // Convert UIImage to CIImage
//        guard let ciImage = CIImage(image: inputImage) else {
//            print("Unable to create CIImage from UIImage.")
//            return
//        }
//
//        // Create a VNCoreMLRequest with the Core ML model
//        guard let model = try? VNCoreMLModel(for: SeeFoodModel().model) else {
//            print("Unable to create VNCoreMLModel from SeeFoodModel.")
//            return
//        }
//        
//        let request = VNCoreMLRequest(model: model) { request, error in
//            guard let results = request.results as? [VNClassificationObservation],
//                  let topResult = results.first else {
//                print("Unexpected results type from VNCoreMLRequest.")
//                return
//            }
//
//            // Update the UI with the classification results
//            DispatchQueue.main.async {
//                self.classificationLabel = "\(topResult.identifier) with confidence \(topResult.confidence)"
//                self.showClassification = true
//            }
//        }
//
//        // Run the request using a VNImageRequestHandler
//        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
//        DispatchQueue.global(qos: .userInitiated).async {
//            do {
//                try handler.perform([request])
//            } catch {
//                print("Failed to perform classification: \(error.localizedDescription)")
//            }
//        }
//    }

//    func processObservations(for request: VNRequest, error: Error?) {
//        DispatchQueue.main.async {
//            if let results = request.results as? [VNClassificationObservation] {
//                if let topResult = results.first {
//                    let identifier = topResult.identifier
//                    let confidence = topResult.confidence
//                    self.classificationLabel = "\(identifier) with confidence \(confidence)"
//                    
//                } else {
//                    self.classificationLabel = "I'm not sure what that is. Try another image."
//                }
//                
//            } else if let error = error {
//                self.classificationLabel = "Error: \(error.localizedDescription)"
//            } else {
//                self.classificationLabel = "Unexpected error occured."
//            }
//            self.showClassification = true
//        }
//    }
    
}

//struct HomeView_Previews: PreviewProvider {
//
//}
#Preview {
    HomeView()
}
