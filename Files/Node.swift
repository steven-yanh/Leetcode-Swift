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
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    func print() {
        var travelNode: ListNode? = self
        Swift.print(travelNode?.val)
        while travelNode?.next != nil {
            travelNode = travelNode?.next
            Swift.print(travelNode?.val)
        }
    }
}
