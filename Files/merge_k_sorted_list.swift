//class Solution {
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        var lists = lists
//        //required as in Swift, Arrays are stored as value type && passed in parameters are constant, so we need another local variable (var lists)
//        //the name of the variable can be duplicated by stacking so we are only modifing the local variable in the following code.
//        //Note: In Swift, we can also pass by "reference" by declaring the parameter signature to the following:
//        //func mergeKLists(_ lists: inout [ListNode?]) -> ListNode?
//        
//        guard !lists.isEmpty else { return nil }
//        
//        //initialize required references
//        var resultHead: ListNode? = nil //headNode for returning
//        var travalNode: ListNode? = nil //Rear of the result list
//        var minHead: ListNode? = nil //smallest node can be found among all the list
//        var minIndex: Int? = nil //index of the minHead Note: needed for changing the reference in the array from head to head.next (cut out the head from its list and let the head point to the next node)
//        
//        //*** Following code(for && if) extracts the smallest node to be the result head
//        //find smallest node and its index
//        for (index, head) in lists.enumerated() {
//            if let head = head {
//                if head.val <= minHead?.val ?? Int.max {
//                    minHead = head
//                    minIndex = index
//                }
//            }
//        }
//        // optional binding to unwrap from a nullable value to be non-nullable (make sure the value is not null)
//        if let minHead = minHead, let minIndex = minIndex {
//            let temp = minHead.next
//            minHead.next = nil
//            resultHead = minHead
//            travalNode = resultHead
//            //make the next node of the minimum node(target) to be the new head and update with the lists
//            lists[minIndex] = temp
//        } else {
//            return nil
//        }
//        
//        
//        //invoke a helper method to check if lists are empty
//        while shouldContinue(lists) {
//            //set them to be null for fiding next smallest node
//            minHead = nil
//            minIndex = nil
//            
//            //*** same as the above(for && if) but extracts the smallest node and append to the rear of the result list
//            for (index, head) in lists.enumerated() {
//                if let head = head {
//                    if head.val <= minHead?.val ?? Int.max {
//                        minHead = head
//                        minIndex = index
//                    }
//                }
//            }
//            if let minHead = minHead, let minIndex = minIndex {
//                let temp = minHead.next
//                minHead.next = nil
//                travalNode?.next = minHead
//                travalNode = travalNode?.next
//
//                lists[minIndex] = temp
//            } else {
//                return nil
//            }
//        }
//        
//        return resultHead
//    }
//    
//    //O(n) by looking at each head node of the list if found one node that is not null which implies we should continue the loop
//    func shouldContinue(_ lists: [ListNode?]) -> Bool {
//        for head in lists {
//            if head != nil {
//                return true
//            }
//        }
//        return false
//    }
//}
//
//
////MARK: - Idiomatic way to find minimum value in Swift by making closures(function)
//lists.min { node1, node2 in
//    guard let node1 = node1, let node2 = node2 else {
//        return false
//    }
//    return node1.val < node2.val
//}
