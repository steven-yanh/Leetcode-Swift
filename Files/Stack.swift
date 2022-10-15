//
//  Stack.swift
//  Leetcode-swift
//
//  Created by Huang Yan on 9/2/22.
//
//
//import Foundation
//class Stack<T> {
//    var head: Node<T>?
//    var first: Node<T>? {
//        return head
//    }
//    var last: Node<T>? 
//    var count: Int = 0
//    func push(_ val: T) {
//        let newNode = Node(val)
//        if head == nil {
//            head = newNode
//            last = newNode
//            count += 1
//        } else {
//            last?.next = newNode
//            last = newNode
//            count += 1
//        }
//    }
//    func pop() -> T?{
//        if head == nil {
//            return nil
//        }
//        var delete = head
//        if head?.next == nil {
//            head = nil
//            return delete?.value
//        }
//        while delete?.next?.next != nil {
//            delete = delete?.next
//            
//        }
//        let deletedValue = delete?.next?.value
//        last = delete
//        last?.next = nil
//        count -= 1
//        return deletedValue
//    }
//}
