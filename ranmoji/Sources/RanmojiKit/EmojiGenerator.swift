import Foundation

protocol EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji
}

final class EmojiGenerator: EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji {
        let emojis = emojis.filter { emoji in
            switch gender {
            case .all:
                return true
            case .woman:
                return emoji.gender == .woman
            case .man:
                return emoji.gender == .man
            }
        }
        return emojis[Int(arc4random_uniform(UInt32(emojis.count)))]
    }
}
