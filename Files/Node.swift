//
//  ClassExample.swift
//  Structs vs. Classes
//
//  Created by Huang Yan on 8/19/22.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
    
}
