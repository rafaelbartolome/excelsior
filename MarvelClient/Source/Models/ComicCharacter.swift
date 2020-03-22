/// API Example by Victor Pimentel
/// https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb

import Foundation

public struct ComicCharacter: Decodable {
    public let id: Int
    public let name: String?
    public let description: String?
    public let modified: String?
    public let thumbnail: Image?
}
