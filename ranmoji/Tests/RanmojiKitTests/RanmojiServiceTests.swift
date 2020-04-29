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

    func test_throws_emojis_not_found() throws {
        try withTemporaryDirectory { tempDir in
            let nonExistentFile = tempDir.appending(component: "does_not_exist.json")
            XCTAssertThrowsSpecific(try subject.run(gender: .all, path: nonExistentFile.pathString),
                                    RanmojiError.emojisNotFound(nonExistentFile))
        }
    }
}
