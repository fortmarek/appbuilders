import ArgumentParser
import TSCBasic

public struct RanmojiCommand: ParsableCommand {    
    public init() {}
    
    public func run() throws {
        try RanmojiService().run()
    }
}
