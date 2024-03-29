//
//  ClassExample.swift
//  Structs vs. Classes
//
//  Created by Huang Yan on 8/19/22.
//

import Foundation
//
//class Node<T> {
//    var value: T
//    var next: Node?
//    
//    init(_ value: T) {
//        self.value = value
//    }
//    
//}
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    func print() {
        var travelNode: ListNode? = self
        while travelNode != nil {
            Swift.print(travelNode?.val ?? -999)
            travelNode = travelNode?.next
        }
    }
    func pValue() {
        Swift.print(val)
    }
}

//public class Node {
//    public var val: Int
//    public var next: Node?
//    public var random: Node?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//        self.random = nil
//    }
//}

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

