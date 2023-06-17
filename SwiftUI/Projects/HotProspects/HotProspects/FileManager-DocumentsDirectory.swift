//
//  FileManager-DocumentsDirectory.swift
//  HotProspects
//
//  Created by Jonathan Copeland on 17/06/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
