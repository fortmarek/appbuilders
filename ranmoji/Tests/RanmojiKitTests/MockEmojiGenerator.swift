import TSCBasic
@testable import RanmojiKit

final class MockEmojiGenerator: EmojiGenerating {
    var generateRandomEmojiStub: (([Emoji], Gender) -> Emoji)?
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji {
        generateRandomEmojiStub?(emojis, gender) ?? Emoji(annotation: "test",
                                                          emoji: "",
                                                          gender: nil)
    }
}
