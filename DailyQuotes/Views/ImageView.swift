import SwiftUI

struct ImageView: View {
  let image: UIImage

  var body: some View {
    Image(uiImage: image)
      .resizable()
      .aspectRatio(contentMode: .fill)
  }
}

struct ImageView_Previews: PreviewProvider {
  static var previews: some View {
    Image(uiImage: UIImage(named: Constants.Image.logo) ?? UIImage())
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 100, height: 100)
      .clipped()
  }
}
