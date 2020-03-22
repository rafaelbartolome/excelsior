/// API Example by Victor Pimentel
/// https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb

import Foundation

public struct GetCharacters: APIRequest {
    public typealias Response = [ComicCharacter]
    
    public var resourceName: String {
        return "characters"
    }
    
    // Parameters
    public let name: String?
    public let nameStartsWith: String?
    public let limit: Int?
    public let offset: Int?
    
    // Note that nil parameters will not be used
    public init(name: String? = nil,
                nameStartsWith: String? = nil,
                limit: Int? = nil,
                offset: Int? = nil) {
        self.name = name
        self.nameStartsWith = nameStartsWith
        self.limit = limit
        self.offset = offset
    }
}

