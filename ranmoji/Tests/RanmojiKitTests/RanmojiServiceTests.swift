import XCTest
import TSCBasic
@testable import RanmojiKit

final class MockFileHandler: FileHandler {
    var currentPathStub: AbsolutePath?
    override var currentPath: AbsolutePath {
        try! currentPathStub ?? determineTempDirectory()
    }
}

final class MockEmojiGenerator: EmojiGenerating {
    var generateRandomEmojiStub: (([Emoji], Gender) -> Emoji)?
    func generateRandomEmoji(_ emojis: [Emoji], gender: Gender) -> Emoji {
        generateRandomEmojiStub?(emojis, gender) ?? Emoji(annotation: "test",
                                                          emoji: "",
                                                          gender: nil,
                                                          skins: nil)
    }
}

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

extension XCTest {
    func XCTAssertThrowsSpecific<Error: Swift.Error & Equatable, T>(_ closure: @autoclosure () throws -> T, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        do {
            _ = try closure()
        } catch let closureError as Error {
            XCTAssertEqual(error, closureError, file: file, line: line)
            return
        } catch let closureError {
            XCTFail("\(error) is not equal to: \(closureError)", file: file, line: line)
            return
        }
        XCTFail("No error was thrown", file: file, line: line)
    }

}
