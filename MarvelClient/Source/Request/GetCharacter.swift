/// API Example by Victor Pimentel
/// https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb

import Foundation

public struct GetCharacter: APIRequest {
    public typealias Response = [ComicCharacter]
    
    // Notice how we create a composed resourceName
    public var resourceName: String {
        return "characters/\(characterId)"
    }
    
    // Parameters
    private let characterId: Int
    
    public init(characterId: Int) {
        self.characterId = characterId
    }
}
