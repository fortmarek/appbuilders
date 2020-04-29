import Foundation
import TSCBasic
import TSCUtility

final class RanmojiService {
    private let fileHandler: FileHandling
    private let emojiGenerator: EmojiGenerating
    
    init(fileHandler: FileHandling = FileHandler(),
         emojiGenerator: EmojiGenerating = EmojiGenerator()) {
        self.fileHandler = fileHandler
        self.emojiGenerator = emojiGenerator
    }
    
    func run() throws {
        
    }
}
