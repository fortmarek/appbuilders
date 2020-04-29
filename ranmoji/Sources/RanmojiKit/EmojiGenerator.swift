import Foundation

protocol EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji
}

final class EmojiGenerator: EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji {
        return emojis[Int(arc4random_uniform(UInt32(emojis.count)))]
    }
}
