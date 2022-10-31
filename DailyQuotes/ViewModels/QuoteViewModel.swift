import Foundation

class QuoteViewModel: ObservableObject {
  @Published var quote = Quote.example

  func getQuotes() async throws {
    guard let url = URL(string: Constants.URL.quote) else {
      print("Invalid URL")
      return
    }


    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)

    let (data, response) = try await session.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode)
    else {
      print("Invalid response.")
      return
    }

    Task { @MainActor in
      do {
        quote = try JSONDecoder().decode(Quote.self, from: data)
      } catch {
        print(error)
      }
    }
  }
}
