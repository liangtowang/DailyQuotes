import SwiftUI

struct QuoteView: View {
  let quote: Quote

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(.white)
        .shadow(radius: 20)

      VStack {
        Text(quote.text ?? Constants.Text.quoteTitle)
          .font(.body)
          .foregroundColor(.black)
          .padding(.bottom, 4)

        Text(quote.author ?? Constants.Text.quoteSubtitle)
          .font(.body)
          .scaledToFit()
          .foregroundColor(.gray)
      }
      .padding(8)
      .multilineTextAlignment(.center)
    }
  }
}

struct QuoteView_Previews: PreviewProvider {
  static var previews: some View {
    QuoteView(quote: Quote.example)
  }
}
