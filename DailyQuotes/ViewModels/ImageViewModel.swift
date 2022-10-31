import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
  @Published var image = UIImage(named: Constants.Image.logo) ?? UIImage()

  func getImage() async throws {
    guard let url = URL(string: Constants.URL.image) else {
      return
    }

    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)


    let (data, _) = try await session.data(from: url)

    Task {@MainActor in
      image = UIImage(data: data) ?? UIImage(named: Constants.Image.logo) ?? UIImage()
    }
  }
}
