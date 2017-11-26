//
//  Logger.swift
//
//  Created by anoop.
//
//

import Foundation

// Debug logging
func dLog( message:  @autoclosure () -> String, filename: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        let fileURL = URL(string: filename)?.lastPathComponent ?? "Unknown file"
        print("[\(fileURL):\(line)] \(function):-", message())
    #endif
}
