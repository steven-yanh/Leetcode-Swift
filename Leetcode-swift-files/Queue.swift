//
//  StructExample.swift
//  Structs vs. Classes
//
//  Created by Huang Yan on 8/19/22.
//

import Foundation
class Queue<T> {
    var head: Node<T>?
    var first: Node<T>? {
        return head
    }
    var last: Node<T>? {
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        return current
    }
    var count: Int = 0
    func enQueue(_ val: T) {
        let newNode = Node(val)
        if head == nil {
            head = newNode
            count += 1
        } else {
            last?.next = newNode
            count += 1
        }
    }
    func deQueue() -> T?{
        if head == nil {
            return nil
        }
        let delete = head
        head = head?.next
        count -= 1
        return delete?.value
//        if head != nil {
//            if head?.next != nil {
//                let delete = head
//                head = head?.next
//                return delete?.value
//            } else {
//                let delete = head
//                head = nil
//                return delete?.value
//            }
//        } else {
//            return nil
//        }
    }
   
}
