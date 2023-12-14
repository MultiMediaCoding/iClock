import SwiftUI

struct ImageListView: View {
    @Binding var selectedImageName: String
    let imageNames: Array<String>
    
    var body: some View {
        List(imageNames, id: \.self) { imageName in
            Button {
                withAnimation(.easeInOut) {
                    selectedImageName = imageName
                }
            } label: {
                ImageListItemView(imageName: imageName, selectedImageName: selectedImageName)
            }
            
        }
      
    }
}

struct ImageListItemView: View {

    let imageName: String
    var selectedImageName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .padding(.trailing, 10)
            
            Text(imageName)
                .foregroundColor(.primary)
                .font(.headline)
            
            Spacer()
            
            
            CheckBox(isChecked: selectedImageName == imageName)
            
        }
    }
}

struct CheckBox: View {
     
    var isChecked: Bool
    var body: some View {
        VStack {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(isChecked ? Color.accentColor : Color.gray)
                .frame(width: 25, height: 25)
        }
    }
}
