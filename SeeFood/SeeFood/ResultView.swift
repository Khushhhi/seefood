
import SwiftUI

struct ResultView: View {
    var label: String
    
    var body: some View {
        VStack{
            Text(label)
                .font(.title)
                .padding()
                .background(label == "Hotdog" ? Color.green : Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ResultView(label: "Not")
}
