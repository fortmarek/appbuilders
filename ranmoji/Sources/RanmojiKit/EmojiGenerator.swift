import Foundation

protocol EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji]) -> Emoji
}

final class EmojiGenerator: EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji]) -> Emoji {
        return emojis[Int(arc4random_uniform(UInt32(emojis.count)))]
    }
}
