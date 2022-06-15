//
//  PatternCompatible.swift
//  mask
//
//  Created by 付文华 on 2022/6/15.
//

public protocol PatternCompatible {
    
    associatedtype PatternBase
    
    var re: Pattern<PatternBase> { get set }
}

extension PatternCompatible {
    
    public var re: Pattern<Self> {
        get {
            return Pattern(self)
        }
        set {}
    }
}

