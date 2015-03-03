//
//  Command.swift
//  docopt
//
//  Created by Pavel S. Mazurin on 3/1/15.
//  Copyright (c) 2015 kovpas. All rights reserved.
//

import Foundation

internal class Command: Argument {
    override internal init(_ name: String?, value: AnyObject? = false) {
        super.init(name, value: value)
    }

    override internal func singleMatch<T: LeafPattern>(left: [T]) -> SingleMatchResult {
        for var i = 0; i < count(left); i++ {
            let pattern = left[i]
            if pattern is Argument {
                if pattern.value as? String == self.name {
                    return (i, Command(self.name, value: true))
                }
            }
        }
        return (0, nil)
    }
}
