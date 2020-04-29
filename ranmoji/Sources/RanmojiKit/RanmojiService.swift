import Foundation
import TSCBasic
import TSCUtility

enum RanmojiError: Equatable, LocalizedError {
    case emojisNotFound(AbsolutePath)
    
    var errorDescription: String? {
        switch self {
        case let .emojisNotFound(path):
            return "Could not find emojis at \(path.pathString). Make sure the file exists."
        }
    }
}

final class RanmojiService {
    private let fileHandler: FileHandling
    private let emojiGenerator: EmojiGenerating
    
    init(fileHandler: FileHandling = FileHandler(),
         emojiGenerator: EmojiGenerating = EmojiGenerator()) {
        self.fileHandler = fileHandler
        self.emojiGenerator = emojiGenerator
    }
    
    func run(gender: Gender,
             path: String?) throws {
        let emojisPath = self.path(path)
        guard fileHandler.exists(emojisPath) else { throw RanmojiError.emojisNotFound(emojisPath) }
        let emojisData = try fileHandler.readFile(emojisPath)
        let emojis = try JSONDecoder().decode([Emoji].self, from: emojisData)
        
        let progressAnimation = PercentProgressAnimation(stream: stdoutStream.stream, header: "Generating random emojis...")
        (0...20).forEach { currentStep in
            let randomEmoji = emojiGenerator.generateRandomEmoji(emojis,
                                                                 gender: gender)
            progressAnimation.update(step: currentStep, total: 20, text: randomEmoji.emoji)
            usleep(100_000)
        }
        progressAnimation.clear()
        progressAnimation.complete(success: true)
        let randomEmoji = emojiGenerator.generateRandomEmoji(emojis,
                                                             gender: gender)
        print("\(randomEmoji.emoji) is your generated random emoji!")
    }
    
    private func path(_ path: String?) -> AbsolutePath {
        if let path = path {
            return AbsolutePath(path, relativeTo: fileHandler.currentPath)
        } else {
            return fileHandler.currentPath.appending(component: "emojis.json")
        }
    }
}

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
