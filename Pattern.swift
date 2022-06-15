//
//  Pattern.swift
//  mask
//
//  Created by 付文华 on 2022/6/15.
//

public struct Pattern<Base> {
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
    
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<Base, Value>) -> ((Value) -> Pattern<Base>) {
        var subject = self.base
        return { value in
            subject[keyPath: keyPath] = value
            return Pattern(subject)
        }
    }
}
