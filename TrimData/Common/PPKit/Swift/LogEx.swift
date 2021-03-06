//
//  LogEx.swift
//  TrimData
//
//  Created by gao feng on 16/2/26.
//  Copyright © 2016年 gao feng. All rights reserved.
//

import UIKit

func log(message: String) {
    let file: NSString = __FILE__
    fprint("\(file.lastPathComponent): \(__FUNCTION__): \(__LINE__): \(message) )")
}

func fprint(format: String, _ args: CVarArgType...) {
    #if DEBUG
    print(NSString(format: format, arguments: getVaList(args)))
    #endif
}

func measure(function: String = __FUNCTION__, _ f: ()->()) {
    let start = CACurrentMediaTime()
    f()
    let end = CACurrentMediaTime()
    fprint("executing time of %@: %.3fms", function, (end - start)*1000)
}
