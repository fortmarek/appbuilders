import TSCBasic
@testable import RanmojiKit

final class MockFileHandler: FileHandler {
    var currentPathStub: AbsolutePath?
    override var currentPath: AbsolutePath {
        try! currentPathStub ?? determineTempDirectory()
    }
}
