/// API Example by Victor Pimentel
/// https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum MarvelError: Error {
    case encoding
    case decoding
    case server(code: Int, message: String)
}
