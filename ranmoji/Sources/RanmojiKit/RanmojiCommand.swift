import ArgumentParser
import TSCBasic

public struct RanmojiCommand: ParsableCommand {
    @Option(
        name: .shortAndLong,
        default: .all
    )
    var gender: Gender
    
    @Option(
        name: .shortAndLong
    )
    var path: String?
    
    public func run() throws {
        try RanmojiService().run(gender: gender,
                                 path: path)
    }
}

enum Gender: String, ExpressibleByArgument {
    case woman
    case man
    case all
}
