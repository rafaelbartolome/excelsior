/// API Example by Victor Pimentel
/// https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb

import PlaygroundSupport
import MarvelClient

// Put your own keys!
// You can freely get a key here: https://developer.marvel.com/docs
let apiClient = MarvelAPIClient(publicKey: "650e801e1408159969078d2a1361c71c",
                                privateKey: "20112b45612fd05f0d21d80d70bc8c971695c7f1")

// A simple request with no parameters
apiClient.send(GetCharacters()) { response in
    print("\nGetCharacters finished:")
    
    response.map { dataContainer in
        for character in dataContainer.results {
            print("  Name: \(character.name ?? "Unnamed character")")
            print("  Thumbnail: \(character.thumbnail?.url.absoluteString ?? "None")")
        }
    }
}

apiClient.send(GetCharacter(characterId: 1011136)){ response in
    print("\nGetCharacter finished:")
    
    response.map { dataContainer in
        for character in dataContainer.results {
            print("  Name: \(character.name ?? "Unnamed character")")
            print("  Thumbnail: \(character.thumbnail?.url.absoluteString ?? "None")")
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
