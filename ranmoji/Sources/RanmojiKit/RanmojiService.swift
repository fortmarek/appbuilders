import Foundation
import TSCBasic
import TSCUtility

struct RanmojiService {
    private let fileHandler: FileHandling
    private let emojiGenerator: EmojiGenerating
    
    init(fileHandler: FileHandling = FileHandler(),
         emojiGenerator: EmojiGenerating = EmojiGenerator()) {
        self.fileHandler = fileHandler
        self.emojiGenerator = emojiGenerator
    }
    
    func run() throws {
        let emojisPath = fileHandler.currentPath.appending(component: "emojis.json")
        let emojisData = try fileHandler.readFile(emojisPath)
        let emojis = try JSONDecoder().decode([Emoji].self, from: emojisData)
        let randomEmoji = emojiGenerator.generateRandomEmoji(emojis)
        print("\(randomEmoji.emoji) is your generated random emoji!")
    }
}
