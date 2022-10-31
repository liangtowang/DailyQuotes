import SwiftUI

struct ContentView: View {
  @StateObject var quoteViewModel = QuoteViewModel()
  @StateObject var imageViewModel = ImageViewModel()
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Color.white
          .edgesIgnoringSafeArea(.all)
        VStack(spacing: 0) {
          VStack(alignment: .center) {
            Text(Constants.Text.appTitle)
              .font(.largeTitle)
              .foregroundColor(.mint)
              .bold()
            Text(Constants.Text.appSubtitle)
              .font(.title)
              .foregroundColor(.mint)
          }
          .padding(.horizontal)
          
          ImageView(image: imageViewModel.image)
            .frame(
              width: geometry.size.width * 0.5,
              height: geometry.size.height * 0.2
            )
            .cornerRadius(10)
            .padding(30)
          QuoteView(quote: quoteViewModel.quote)
            .frame(
              width: geometry.size.width * 0.9,
              height: geometry.size.height * 0.5
            )
            .onTapGesture {
              Task {
                do {
                  try await quoteViewModel.getQuotes()
                  try await imageViewModel.getImage()
                } catch {
                  print(error)
                }
              }
            }
          Spacer()
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
