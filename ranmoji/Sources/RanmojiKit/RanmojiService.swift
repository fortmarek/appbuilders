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
        
        let progressAnimation = PercentProgressAnimation(stream: stdoutStream.stream, header: "Generating random emojis...")
        (0...20).forEach { currentStep in
            let randomEmoji = emojiGenerator.generateRandomEmoji(emojis)
            progressAnimation.update(step: currentStep, total: 20, text: randomEmoji.emoji)
            usleep(100_000)
        }
        progressAnimation.clear()
        progressAnimation.complete(success: true)
        let randomEmoji = emojiGenerator.generateRandomEmoji(emojis)
        print("\(randomEmoji.emoji) is your generated random emoji!")
    }
}
