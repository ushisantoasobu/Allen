//
//  SourceEditorCommand.swift
//  AllenExtension
//
//  Created by Shunsuke Sato on 2016/12/19.
//  Copyright © 2016年 Shunsuke Sato. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    // Ref: http://dev.classmethod.jp/smartphone/iphone/xcode-source-editor-extension-how-to-create/
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let textBuffer = invocation.buffer

        let lines = textBuffer.lines
        let selections = textBuffer.selections
        
        guard let selection = selections.firstObject as? XCSourceTextRange else {
            completionHandler(NSError(domain: "SampleExtension", code: 401, userInfo: ["reason": "text not selected"]))
            return
        }
        
        let line = selection.end.line
        let start = selection.start.column
        let end = selection.end.column

        let string = lines[line] as! String

        let startIndex = string.index(string.startIndex, offsetBy: start)
        let endIndex = string.index(string.startIndex, offsetBy: end)
        let range = startIndex..<endIndex
        let selectedString = string.substring(with: range)

        lines[line] = string.replacingCharacters(in: range, with: self.snake2Camel(string: selectedString))

        completionHandler(nil)
    }

    /*
     * snake to camel
     * Ref: https://github.com/speee/jsonschema2swift/
     */
    private func snake2Camel(string: String) -> String{
        let items = string.components(separatedBy: "_")
        var camelCase = ""
        items.enumerated().forEach {
            camelCase += 0 == $0 ? $1.lowercased() : $1.capitalized
        }
        return camelCase
    }
    
}
