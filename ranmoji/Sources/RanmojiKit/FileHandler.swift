import Foundation
import TSCBasic

protocol FileHandling {
    func readFile(_ at: AbsolutePath) throws -> Data
    func exists(_ path: AbsolutePath) -> Bool
    var currentPath: AbsolutePath { get }
}

class FileHandler: FileHandling {
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    var currentPath: AbsolutePath {
        AbsolutePath(fileManager.currentDirectoryPath)
    }
    
    func readFile(_ at: AbsolutePath) throws -> Data {
        return try Data(contentsOf: at.asURL)
    }
    
    public func exists(_ path: AbsolutePath) -> Bool {
        let exists = fileManager.fileExists(atPath: path.pathString)
        return exists
    }
}
