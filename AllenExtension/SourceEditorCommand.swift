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
        let end = selection.end.column
        
        let indentSpace = String(repeating: " ", count: end)
        lines.insert("\(indentSpace)let message = \"Hello!\"", at: line)
        
        completionHandler(nil)
    }
    
}
