import Foundation

protocol EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji]) -> Emoji
}

final class EmojiGenerator: EmojiGenerating {
    func generateRandomEmoji(_ emojis: [Emoji]) -> Emoji {
        return emojis[Int.random(in: 0..<emojis.count)]
    }
}
