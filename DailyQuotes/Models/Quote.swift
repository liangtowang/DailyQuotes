import Foundation

struct Quote: Codable, Identifiable {
  let id: String
  let author: String?
  let text: String?

  enum CodingKeys: String, CodingKey {
    case id, author
    case text = "en"
  }

  static var example: Quote {
    Quote(
      id: "asd875sad68s6ad",
      author: "Steve Jobs",
      text: "The people who are crazy enough to think they can change the world are the ones who do."
    )
  }
}
