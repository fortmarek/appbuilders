import XCTest

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
