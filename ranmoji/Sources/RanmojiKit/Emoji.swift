import Foundation

struct Emoji: Decodable {
    let annotation: String
    let emoji: String
    let gender: Gender?
    
    enum Gender: Int, Decodable {
        case woman
        case man
    }
}
