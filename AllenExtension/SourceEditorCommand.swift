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
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        completionHandler(nil)
    }
    
}
