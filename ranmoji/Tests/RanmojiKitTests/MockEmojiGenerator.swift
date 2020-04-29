import TSCBasic
@testable import RanmojiKit

final class MockEmojiGenerator: EmojiGenerating {
    var generateRandomEmojiStub: (([Emoji]) -> Emoji)?
    func generateRandomEmoji(_ emojis: [Emoji]) -> Emoji {
        generateRandomEmojiStub?(emojis) ?? Emoji(annotation: "test",
                                                          emoji: "",
                                                          gender: nil)
    }
}
