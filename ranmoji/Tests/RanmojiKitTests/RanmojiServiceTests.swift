import XCTest
import TSCBasic
@testable import RanmojiKit

final class RanmojiServiceTests: XCTestCase {
    var fileHandler: MockFileHandler!
    var emojiGenerator: MockEmojiGenerator!
    var subject: RanmojiService!
    
    override func setUp() {
        super.setUp()
        
        fileHandler = MockFileHandler()
        emojiGenerator = MockEmojiGenerator()
        subject = RanmojiService(fileHandler: fileHandler,
                                 emojiGenerator: emojiGenerator)
    }
}
