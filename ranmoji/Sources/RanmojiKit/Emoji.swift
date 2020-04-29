import Foundation

struct Emoji: Decodable {
    let annotation: String
    let emoji: String
    let gender: Gender?
    let skins: [Emoji]?
    
    enum Gender: Int, Decodable {
        case woman
        case man
    }
}
