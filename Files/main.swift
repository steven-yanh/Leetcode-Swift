//  Created by Huang Yan on 8/19/22.

import Foundation
let start = CFAbsoluteTimeGetCurrent()
let solution = Solution()
//MARK: playing around anything
// Stacks && Queue
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//stack.push(4)
//print(stack.pop())
//print(stack.count)
//print(stack.last?.value)
// Node (classes)
//let n1 = ListNode(1)
//let n2 = ListNode(2)
//let n3 = ListNode(3)
//let n4 = ListNode(4)
//let n5 = ListNode(5)
//n1.next = n2
//n2.next = n3
//n3.next = n4
//n4.next = n5
//let refN4 = n3.next
//let arr = [n1,n2,n3,n5]
//if arr.contains(where: { node in // triple equal comparing the reference of data
//    return refN4 === node
//}) {
//    print(true)
//} else {
//    print(false)
//}
//print(refN4 === n4)
//n1.print()
//n1.next = n1 // valid, a node can point to it self and cause infinity loop
//n1.print()

// Struct
//struct StructA {
//    let val: Int
//}
//let s1 = StructA(val: 1)
//let s2 = StructA(val: 1)
//let int1 = 1
//let int2 = 2
//let int3 = 3
//let intRef = int1
//print(s1 == s2)

// Tree
// initTree
//let tNode1 = TreeNode(1)
//let tNode2 = TreeNode(2)
//let tNode3 = TreeNode(3)
//let tNode4 = TreeNode(4)
//let tNode5 = TreeNode(5)
//let tNode6 = TreeNode(6)
//let tNode7 = TreeNode(7)
//tNode1.left = tNode2
//tNode1.right = tNode3
//tNode2.left = tNode4
//tNode2.right = tNode5
//tNode3.left = tNode6
//tNode3.right = tNode7




//MARK: - (Array)1. Two Sum
//let nums = [3,2,4], target = 6
//let solotion = Solution()
//print(solotion.twoSum(nums, target))
//class Solution { // sample answer
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var check: [Int:Int] = [:]
//        for (index, item) in nums.enumerated(){
//            let diff = target - item
//            // print("target = \(target), item = \(item), diff = \(diff)")
//            // print(String(describing: check[item]))
//            if let pre_index = check[item] {
//                return [pre_index, index]
//            } else {
//                check[diff] = index
//            }
//        }
//        return []
//    }
//}

//MARK: my solution: passed
//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var ans = [Int]()
//        for i in 0..<nums.count {
//            if ans.count == 0 {
//                for j in i+1..<nums.count{
//                    if nums[i] + nums[j] == target {
//                        ans.append(i)
//                        ans.append(j)
//                        break
//                    }
//                }
//            }
//        }
//        return ans
//    }
//}

//MARK: - 🟡3.(Sliding Window) Longest Substring Without Repeating Characters
//let s = "bbbbbbb"
//let solution = Solution()
//print(solution.lengthOfLongestSubstring(s))

//MARK: my solution (passed)
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        guard s.count > 1 else { return s.count }
//        var maxLen = 0
//        var counter = 0
//        var arr = [Character]()
//        for char in s  {
//            if !arr.contains(char) {
//                arr.append(char)
//                counter = arr.count
//                print(counter)
//            } else {
//                maxLen = max(counter,maxLen)
//                let index = arr.firstIndex(of: char)
//                arr.removeFirst(index!+1)
//                counter = arr.count
//                arr.append(char)
//            }
//        }
//        maxLen = max(maxLen,counter)
//        return maxLen
//    }
//}

//MARK: retry with frame work
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var window:[Character:Int] = [:] //swift dictionary is kind of slow? Ans: dictionary is not slow String.count is O(n)
//        let array = Array(s)
//        var res = 0
//        var left = 0, right = 0
//        while right < array.count {
//            let rightChar = array[right]
//            right += 1
//            window[rightChar, default: 0] += 1
//            while window[rightChar]! > 1 { //shrink window
//                let leftChar = array[left]
//                window[leftChar, default: 0] -= 1
//                left += 1
//            }
//            res = max(res, right - left)
//        }
//        return res
//    }
//}

//MARK: - (Two pointers)🟡11. Container With Most Water
//let height = [1,8,6,2,5,4,8,25,7]
//let solution = Solution()
//print(solution.maxArea(height))
//MARK: my solution (hinted)
//class Solution {
//    func maxArea(_ height: [Int]) -> Int {
//        var maxArea = 0
//        var left = 0
//        var right = height.count - 1
//        while left < right {
//            let lower = min(height[left], height[right])
//            let currentArea = lower * (right-left)
//            maxArea = max(maxArea,currentArea)
//
//            if height[left] < height[right] {
//                left += 1
//            } else {
//                right -= 1
//            }
//        }
//        return maxArea
//    }
//}
//MARK: - 🟡15. 3 Sum
//let nums = [-1,0,1,2,-1,-4]
//let solution = Solution()
//print(solution.threeSum(nums))
//MARK: my solution (passed)
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var ans = [[Int]]()
//        for (index,num) in nums.enumerated() {
//            let target = num
//            var dict = [Int:Int]()
//            for j in index+1..<nums.count {
//                let diff = target + nums[j]
//                if let third = dict[nums[j]] {
//                    let result = [target,nums[j],third].sorted()
//                    if !ans.contains(result) {
//                        ans.append(result)
//                    }
//                } else {
//                    dict[-diff] = nums[j]
//                }
//            }
//        }
//        return ans
//    }
//
//}
//

//MARK: - (LinkedList)🟡19. Remove Nth Node From End of List

//MARK: my solution (great) put all nodes in array
//class Solution {
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        var travelNode = head
//        var nodeArray = [travelNode]
//        while travelNode?.next != nil {
//            nodeArray.append(travelNode?.next)
//            travelNode = travelNode?.next
//        }
//        if n == nodeArray.count && n != 1 {
//            return nodeArray[1]
//        }
//        if n != 1 {
//            let prev = nodeArray[nodeArray.count - n - 1]
//            prev?.next = prev?.next?.next
//        } else if nodeArray.count != 1{
//            nodeArray[nodeArray.count - 2]?.next = nil
//        } else {
//            return nil
//        }
//        return head
//    }
//}

//MARK: my solution (great) traditional way by reversing list twice
//class Solution {
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        //reverse entire LinkedList
//        var prev:ListNode? = nil
//        var travelNode = head
//        while travelNode?.next != nil {
//            let temp = travelNode?.next
//            travelNode?.next = prev
//            prev = travelNode
//            travelNode = temp
//        }
//        var newHead = travelNode
//        travelNode?.next = prev
//        if n == 1 {
//            newHead = newHead?.next
//        } else {
//            var count = 1
//            prev = nil
//            while count < n {
//                prev = travelNode
//                travelNode = travelNode?.next
//                count += 1
//            }
//            prev?.next = travelNode?.next
//        }
//        //reverse entire list back
//        prev = nil
//        while newHead?.next != nil {
//            let temp = newHead?.next
//            newHead?.next = prev
//            prev = newHead
//            newHead = temp
//        }
//        newHead?.next = prev
//        return newHead
//    }
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var prev: ListNode? = nil
//        var p = head
//        while p?.next != nil {
//            let temp = p?.next
//            p?.next = prev
//            prev = p
//            p = temp
//        }
//        return p
//    }
//}

//MARK: - 🟢20. Valid Parentheses
//let s = "()[]{{}"
//let solution = Solution()
//print(solution.isValid(s))
//MARK:  my solution(passed) great 3ms
//class Solution {
//    func isValid(_ s: String) -> Bool {
//        let dict: [Character:Character] = [")":"(",    "]":"[",    "}":"{"]
//        var stack = [Character]()
//        for char in s {
//            if let symbol = dict[char] {
//                if symbol != stack.popLast() {
//                    return false
//                }
//            } else {
//                stack.append(char)
//            }
//        }
//        return stack.isEmpty
//    }
//}

//MARK: - 🟢21. Merge Two Sorted Lists

//MARK: my solution
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//class Solution {
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        var newNode: ListNode?
//        var travalNode: ListNode?
//        var currentNode1 = list1
//        var currentNode2 = list2
//        while currentNode1 != nil && currentNode2 != nil {
//            if currentNode1!.val < currentNode2!.val {
//                if newNode == nil {
//                    newNode = ListNode(currentNode1!.val)
//                    travalNode = newNode
//                    currentNode1 = currentNode1?.next
//                } else {
//                    travalNode?.next = ListNode(currentNode1!.val)
//                    travalNode = travalNode?.next
//                    currentNode1 = currentNode1?.next
//                }
//            } else {
//                if newNode == nil {
//                    newNode = ListNode(currentNode2!.val)
//                    travalNode = newNode
//                    currentNode2 = currentNode2?.next
//                } else {
//                    travalNode?.next = ListNode(currentNode2!.val)
//                    travalNode = travalNode?.next
//                    currentNode2 = currentNode2?.next
//                }
//            }
//        }
//        while currentNode1 != nil {
//            if newNode == nil {
//                newNode = ListNode(currentNode1!.val)
//                travalNode = newNode
//                currentNode1 = currentNode1?.next
//            } else {
//            travalNode?.next = ListNode(currentNode1!.val)
//            travalNode = travalNode?.next
//            currentNode1 = currentNode1?.next
//            }
//        }
//        while currentNode2 != nil {
//            if newNode == nil {
//                newNode = ListNode(currentNode2!.val)
//                travalNode = newNode
//                currentNode2 = currentNode2?.next
//            } else {
//            travalNode?.next = ListNode(currentNode2!.val)
//            travalNode = travalNode?.next
//            currentNode2 = currentNode2?.next
//            }
//        }
//
//        return newNode
//    }
//}

//MARK: - 🟡(DP)22. Generate Parentheses
//let n = 3
//// ["((()))","(()())","(())()","()(())","()()()"]
//let s = Solution()
//print(s.generateParenthesis(n))
//MARK: my solution (great) (pass by reference)
//class Solution {
//    func generateParenthesis(_ n: Int) -> [String] {
//        var ans = [String]()
//        let open = 0
//        let close = 0
//        let string = ""
//        generate(open: open, close: close,n: n ,string: string, ans: &ans)
//        return ans
//    }
//    func generate(open: Int, close: Int,n: Int, string: String, ans: inout [String]) {
//        if open == close && close == n {
//            ans.append(string)
//        }
//        if open < n {
//            var str = string
//            str.append("(")
//            generate(open: open+1, close: close, n: n, string: str, ans: &ans)
//        }
//        if close < open {
//            var str = string
//            str.append(")")
//            generate(open: open, close: close+1, n: n, string: str, ans: &ans)
//        }
//    }
//}

//MARK: - 🔴23. Merge k Sorted Lists
//let head1 = ListNode(1)
//head1.next = ListNode(2, .init(3))
//
//let head2 = ListNode(4)
//head2.next = ListNode(5, .init(6))
//
//let head3 = ListNode(7)
//head3.next = ListNode(8, .init(9))
//
//let list = [head1, head2, head3]
//
//solution.mergeKLists(list)?.print()
//
//class Solution { 
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        var lists = lists
//        //find the first
//        guard !lists.isEmpty else { return nil }
//        var resultHead: ListNode? = nil
//        var travalNode: ListNode? = nil
//        var minHead: ListNode? = nil
//        var minIndex: Int? = nil
//        for (index, head) in lists.enumerated() {
//            if let head = head {
//                if head.val <= minHead?.val ?? Int.max {
//                    minHead = head
//                    minIndex = index
//                }
//            }
//        }
//        if let minHead = minHead, let minIndex = minIndex {
//            let temp = minHead.next
//            minHead.next = nil
//            resultHead = minHead
//            travalNode = resultHead
//
//            lists[minIndex] = temp
//        } else {
//            return nil
//        }
//
//        while shouldContinue(lists) {
//            minHead = nil
//            minIndex = nil
//            print(shouldContinue(lists))
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
//    func shouldContinue(_ lists: [ListNode?]) -> Bool {
//        for head in lists {
//            if head != nil {
//                return true
//            }
//        }
//        return false
//    }
//}


//MARK: - 🟢(Two pointers)26. Remove Duplicates from Sorted Array
//class Solution { // sample solution 41ms
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        nums = Array(Set(nums)).sorted()
//        return nums.count
//    }
//}
//class Solution { // 49ms beats 97%
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        var slow = 0, fast = 0
//        while fast < nums.count {
//            if nums[slow] != nums[fast] {
//                slow += 1
//                nums[slow] = nums[fast]
//            }
//            fast += 1
//        }
//        return slow + 1
//    }
//}

//MARK: - 🟢(Two pointers)27. Remove Element
//class Solution { //3ms beats 97%
//    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        var slow = 0, fast = 0
//        while fast < nums.count {
//            if nums[fast] != val {
//                nums[slow] = nums[fast]
//                slow += 1
//            }
//            fast += 1
//        }
//        return slow
//    }
//}


//MARK: - 33. Search in Rotated Sorted Array
//let nums = [4,5,6,7,0,1,2], target = 5
//let s = Solution()
//print(s.search(nums, target))
//MARK: my solution (hinted)
//class Solution {
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        var start = 0
//        var end = nums.count - 1
//        while start <= end {
//            let middle = (start + end) / 2
//            if nums[middle] == target {
//                return middle
//            }
//
//            if nums[start] <= nums[middle] {
//                if target > nums[middle] || target < nums[start]{
//                    start = middle + 1
//                } else {
//                    end = middle - 1
//                }
//            } else {
//                if target > nums[end] || target < nums[middle]{
//                    end = middle - 1
//                } else {
//                    start = middle + 1
//                }
//            }
//        }
//        return -1
//    }
//}

//MARK: - 36. Valid Sudoku
//let board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
//let solution = Solution()
//print(solution.isValidSudoku(board))
//MARK: my solution (passed)(great)
//class Solution {
//    func isValidSudoku(_ board: [[Character]]) -> Bool {
//        var boxDict = [[[Character:Int]]]()
//        for (index,arr) in board.enumerated() {
//            var verticalDict = [Character:Int]()
//            var dict = [Character:Int]()
//            for i in 0...2 { //initial the boxes
//                boxDict.append([])
//                for _ in 0...2 {
//                    boxDict[i].append([:])
//                }
//            }
//
//            for i in 0..<arr.count {
//                let boxRow = index/3
//                let boxCol = i/3
//                let currentChar = board[index][i]
//
//                if currentChar != "." { //checking boxes
//                    if let _ = boxDict[boxRow][boxCol][currentChar] {
//                        return false
//                    } else {
//                        boxDict[boxRow][boxCol][currentChar] = 1
//                    }
//                }
//                let verticalChar = board[i][index]
//                if verticalChar != "."{//checking vertical
//                    if let _ = verticalDict[verticalChar] {
//                        return false
//                    } else {
//                        verticalDict[verticalChar] = 1
//                    }
//                }
//                if arr[i] != "." {//checking horizontal
//                    if let _ = dict[arr[i]] {
//                        return false
//                    } else {
//                        dict[arr[i]] = 1
//                    }
//                }
//
//            }
//
//        }
//        return true
//    }
//}

//MARK: - 🟡39.(Backtrack) Combination Sum
//MARK: 1. sometimes we need to sort the input but we don't need it for this question.    2.the real optimized is starting from current position instead of using previous all over again
//let candidates = [6,2,3,7], target = 7
//print(solution.combinationSum(candidates, target))
//class Solution { // 14ms beats 90% the real optimized is starting from current position instead of using previous all over again
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        var res = [[Int]]()
//        var track = [Int]() // tracking path
//        backtrack(candidates, &res, &track, target, 0, 0)
//        return res
//    }
//    func backtrack(_ nums: [Int], _ res: inout [[Int]],_ track: inout [Int],_ target: Int, _ sum: Int, _ start: Int) {
//        if sum == target {
//            let sortedTrack = track.sorted()
//            if !res.contains(sortedTrack) {
//                res.append(sortedTrack)
//            }
//        }
//        if sum > target {
//            return
//        }
//        for i in start..<nums.count {
//            track.append(nums[i])
//            backtrack(nums, &res, &track, target, sum + nums[i], i)
//            track.removeLast()
//        }
//    }
//}

//MARK: -🟡40. Combination Sum II
//let candidates = [10,1,2,7,6,1,5], target = 8
//print(solution.combinationSum2(candidates, target))
//class Solution { // 14ms beats 86% by using break will increse speed; was 300 ms
//    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        var res = [[Int]]()
//        var track = [Int]()
//        let candidates = candidates.sorted()
//
//        func backtrack(_ start: Int, _ sum: Int) {
//            if sum == target {
//                let sortedTrack = track.sorted()
//                if !res.contains(sortedTrack) {
//                    res.append(sortedTrack)
//                }
//            }
//            for i in start..<candidates.count {
//                if i > start && candidates[i] == candidates[i - 1] {
//                    continue
//                }
//                if sum + candidates[i] > target {
//                    break
//                }
//                track.append(candidates[i])
//                backtrack(i+1, sum+candidates[i])
//                track.removeLast()
//            }
//        }
//        backtrack(0, 0)
//        return res
//    }
//}

//MARK: - 42. 🔴Trapping Rain Water
//let height = [0,1,0,2,1,0,1,3,2,1,2,1]
//let solution = Solution()
//print(solution.trap(height))
//MARK: my solution (hint)
//class Solution {
//    func trap(_ height: [Int]) -> Int {
//        var totalRain = 0
//        var leftMax = [Int]()
//        var left = 0
//        var rightMax:[Int] = [Int].init(repeating: 0, count: height.count)
//        var right = 0
//        var minHeight = [Int].init(repeating: 0, count: height.count)
//        for high in height {
//            leftMax.append(left)
//            left = max(left, high)
//        }
//        for i in stride(from: height.count - 1, to: -1, by: -1) {
//            rightMax[i] = right
//            right = max(right,height[i])
//        }
//        for i in 0..<height.count {
//            minHeight[i] = min(leftMax[i],rightMax[i])
//        }
//
//        // actual calculation:
//        for i in 0..<height.count {
//            let water = minHeight[i] - height[i]
//            if water > 0 {
//                totalRain += water
//            }
//        }
//
//        return totalRain
//    }
//}

//MARK: - 🟡46. Permutations
//MARK: (Backtrack) think of it as a tree and traverse the whole tree, for each dicision(go to next level) check if selection is already used.
//let nums = [1,2,3]
//print(solution.permute(nums))
//class Solution { // 16ms beats 77%
//    var res = [[Int]]()
//    func permute(_ nums: [Int]) -> [[Int]] {
//        var visited = Array(repeating: false, count: nums.count)
//        var onPath = [Int]()
//        backtrack(nums, &visited, &onPath)
//        return res
//    }
//    func backtrack(_ nums: [Int], _ visited: inout [Bool], _ onPath: inout [Int]) {
//        if onPath.count == nums.count {
//            res.append(onPath)
//        }
//        for i in 0..<nums.count {
//            let num = nums[i]
//            if visited[i] == true {
//                // already chosen, try other paths
//                continue
//            }
//            // make choice
//            visited[i] = true
//            onPath.append(num)
//            backtrack(nums, &visited, &onPath)
//            // withdraw choice
//            visited[i] = false
//            onPath.removeLast()
//        }
//    }
//}

//MARK: - 🟡47. Permutations II
//MARK:
//let nums = [1,1,2]
//print(solution.permuteUnique(nums))
//class Solution {
//    var res = [[Int]]()
//    func permuteUnique(_ nums: [Int]) -> [[Int]] {
//        var visited = Array(repeating: false, count: nums.count)
//        var onPath = [Int]()
//        backtrack(nums, &visited, &onPath)
//        return res
//    }
//    func backtrack(_ nums: [Int], _ visited: inout [Bool], _ onPath: inout [Int]) {
//        if onPath.count == nums.count && !res.contains(onPath) {
//            res.append(onPath)
//        }
//        for i in 0..<nums.count {
//            if visited[i] == true {
//                // already chosen, try other paths
//                continue
//            }
//            visited[i] = true
//            onPath.append(nums[i])
//            backtrack(nums, &visited, &onPath)
//            visited[i] = false
//            onPath.removeLast()
//        }
//    }
//}

//MARK: - 🟡49. Group Anagrams
//let strs = ["eat","tea","tan","ate","nat","bat"]
//print(solution.groupAnagrams(strs))
//MARK: retry
//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var map = [String: [String]]()
//        for str in strs {
//            let sortedString = String(str.sorted())
//            if var array = map[sortedString] {
//                array.append(str)
//                map[sortedString] = array
//            } else {
//                map[sortedString] = [str]
//            }
//        }
//        return Array(map.values)
//    }
//}
//MARK: sample version
//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var output: [[String]] = []
//        var sortedChars: [[Character]: Int] = [:]
//        var groupID = 0
//        for (i, str) in strs.enumerated() {
//            let sorted = Array(str).sorted()
//            if let group = sortedChars[sorted] {
//                output[group].append(str)
//            } else { // DNE so make new group and set groupID to key(sortedString) value(groupID)
//                sortedChars[sorted] = groupNumber
//                groupID += 1
//                output.append([str])
//            }
//        }
//        return output
//    }
//}

//MARK: my solution (passed)
//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var ans = [[String]]()
//        var dictionary: [String:Int] = [:] // key:String pattern: index //better solution -> dict = [String: [String]]()
//        for (index,item) in strs.enumerated() {
//            let prevSize = dictionary.count
//            dictionary[String(item.sorted())] = index // pattern: index
//            if prevSize != dictionary.count{ //new pattern
//                let newPattern = [item]
//                ans.append(newPattern)
//            } else {
//                for i in 0..<ans.count{
//                    if String(ans[i][0].sorted()) == String(item.sorted()) { //meaning same pattern
//                        ans[i].append(item)
//                    }
//                }
//            }
//        }
//        print(dictionary.values)
//        return ans
//    }
//}

//MARK: - 70. 🟢Climbing Stairs
//print(solution.climbStairs(3))
//class Solution { // iterative (button up) 0ms
//    func climbStairs(_ n: Int) -> Int {
//        guard n > 2 else {
//            return n
//        }
//        var n1 = 1, n2 = 2
//        for _ in 3...n {
//            let temp = n1 + n2
//            n1 = n2
//            n2 = temp
//        }
//        return n2
//    }
//}
//class Solution { // recursive (top down) 5ms
//    var memo = [Int]()
//    func climbStairs(_ n: Int) -> Int {
//        memo = Array(repeating: 0, count: n+1)
//        return dp(n)
//    }
//    func dp(_ n: Int) -> Int {
//        if memo[n] != 0 {
//            return memo[n]
//        }
//        if n == 1 || n == 2 {
//            memo[n] = n
//            return n
//        }
//        memo[n] = dp(n-1) + dp(n-2)
//        return memo[n]
//    }
//}

//MARK: - 🟢746. Min Cost Climbing Stairs
// cost = [10, 15, 20]
//                  0  1  2   3
//                       begin
//
//                /                     \
//               0,0                    1,0
//           /       \                  / \
//         1,10      2,10            2,15  3,15
//         / \        /  \            / \  *res
//      2,25 3,25   3,30 4,30       3 | 4,35
//      /\    *      *    *          *  *
//     3|4,45
//     *  *
//let cost = [10,15,20]
//print("res ",solution.minCostClimbingStairs(cost))
//class Solution { // 23ms beats 95% Acutal DP solution with memo to optimize time complexity
//    var memo = [Int]()
//    func minCostClimbingStairs(_ cost: [Int]) -> Int {
//        memo = Array(repeating: -1, count: cost.count + 2)
//        return min(dp(cost, 0), dp(cost, 1))
//    }
//    func dp(_ cost: [Int], _ position: Int) -> Int {
//        // if memo exist a cost we don't have to compute again
//        if memo[position] != -1 {
//            return memo[position]
//        }
//        if position >= cost.count {
//            return 0
//        }
//        let res1 = dp(cost, position+1)
//        let res2 = dp(cost, position+2)
//        let returnValue = cost[position] + min(res1, res2)
//        // store to memo
//        memo[position] = cost[position] + min(res1, res2)
//        return returnValue
//    }
//}

//class Solution { // 76ms
//    func minCostClimbingStairs(_ cost: [Int]) -> Int {
//        var dp = cost
//        dp.append(0)
//        for i in stride(from: cost.count - 2, through: 0, by: -1) {
//            dp[i] = cost[i] + min(dp[i+1], dp[i+2])
//        }
//        return min(dp[0], dp[1])
//    }
//}



//MARK: - 74. Search a 2D Matrix
//let matrix =  [[1,3,5,7],[10,11,16,20],[23,30,34,60]],target = 34
//let s = Solution()
//print(s.searchMatrix(matrix, target))
//MARK: my solution (great) O(log n)
//class Solution {
//    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//
//        guard target <= matrix[matrix.count-1].last!, target >= matrix[0][0] else { return false}
//
//        var start = 0
//        var middle = matrix.count / 2
//        var end = matrix.count - 1
//        while start <= end {
//            if matrix[middle][0] <= target && target <= matrix[middle].last!{
//                print(middle)
//                break
//            } else if matrix[middle].last! < target {
//                start = middle + 1
//                middle = start + (end - start) / 2
//            } else {
//                end = middle - 1
//                middle = (end - start) / 2
//            }
//        }
//        let row = matrix[middle]
//        start = 0
//        middle = row.count / 2
//        end = row.count - 1
//        while start <= end {
//            if row[middle] == target {
//                return true
//            }
//            if row[middle] > target {
//                end = middle - 1
//                middle = (end - start) / 2
//            } else {
//                start = middle + 1
//                middle = start + (end - start) / 2
//            }
//        }
//        return false
//    }
//}

//MARK: my solution (passed)
//class Solution {
//    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
////        var start = 0
////        var middle = matrix.count / 2
////        var end = matrix.count - 1
////        while start <= end {
////            if matrix[middle][0] > target {
////                end = middle - 1
////                middle = (end - start) / 2
////            } else {
////                start = middle + 1
////                middle = start + (end - start) / 2
////            }
////        }
//        var rowNum: Int = 0
//        for i in 0..<matrix.count - 1 {
//            if target >= matrix[i][0] && target < matrix[i+1][0] {
//                rowNum = i
//            }
//        }
//        if target >= matrix.last![0] {
//            rowNum = matrix.count - 1
//        }
//        let row = matrix[rowNum]
//        var start = 0
//        var middle = row.count / 2
//        var end = row.count - 1
//        while start <= end {
//            if row[middle] == target {
//                return true
//            }
//            if row[middle] > target {
//                end = middle - 1
//                middle = (end - start) / 2
//            } else {
//                start = middle + 1
//                middle = start + (end - start) / 2
//            }
//        }
//        return false
//    }
//}

//MARK: - 76. Minimum Window Substring
//let s = "a", t = "a"
//let so = Solution()
//print(so.minWindow(s, t))

//MARK: my solution (pass)
//class Solution {
//    func minWindow(_ s: String, _ t: String) -> String {
//        guard s.count >= t.count else {
//            return ""
//        }
//        var window: [Character: Int] = [:]
//        var need: [Character: Int] = [:]
//        var resLeft = 0
//        var resRight = 0
//        var range = Int.max
//        for char in t {
//            need[char, default: 0] += 1
//        }
//        var valid = 0
//        let array = Array(s)
//        var left = 0, right = 0
//        while right < array.count {
//            window[array[right], default: 0] += 1
//            if window[array[right]]! == need[array[right]] ?? 0 {
//                valid += 1
//            }
//            right += 1
//            while valid == need.count && left < right {
//                window[array[left]]! -= 1
//                if window[array[left]]! < need[array[left]] ?? 0 {
//                    valid -= 1
//                }
//                if right-left-1 < range {
//                    range = right-left
//                    resLeft = left
//                    resRight = right - 1
//                }
//                print(resLeft,resRight)
//                left += 1
//            }
//        }
//        if range == Int.max {
//            return ""
//        } else {
//            return String(array[resLeft...resRight])
//        }
//
//    }
//}

//MARK: - 🟡77(Backtrack). Combinations
//MARK: classical combinational problem it's also a tree structure but think of it as the result is on the K level
//let n = 4, k = 2
//print(solution.combine(n, k))
//class Solution { //64ms beats 93%    improved by passing inout variable instead of creating data members
//    // O(n!)
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        var res = [[Int]]()
//        var track = [Int]()
//        backtrack(n, k, 1, &res, &track)
//        return res
//    }
//    func backtrack(_ n: Int, _ k: Int, _ start: Int, _ res: inout [[Int]], _ track: inout [Int]) {
//        print(track)
//        if track.count == k {
//            res.append(track)
//            return // this is important because we don't need to go forward with more elemetns
//        }
//        for i in start..<n+1 {
//            track.append(i)
//            backtrack(n, k, i+1, &res, &track)
//            track.removeLast()
//        }
//    }
//}

//MARK: - 🟡78(BackTrack). Subsets
//MARK: DFS 1. think of it as tree   2. element not duplicated and can be selected only once
//let nums = [1,2,3]
//print(solution.subsets(nums))
//class Solution { // 3ms beats 99%
//    // O(n!)
//    var res = [[Int]]()
//    var track = [Int]()
//    func subsets(_ nums: [Int]) -> [[Int]] {
//        backtrack(nums, 0)
//        return res
//    }
//    func backtrack(_ nums: [Int], _ start: Int) { //avoid duplicate use
//        res.append(track)
//        for i in start..<nums.count {
//            track.append(nums[i])
//            backtrack(nums, i + 1) // !!! i + 1
//            track.removeLast()
//        }
//    }
//}
//MARK: - (Backtrack)🟡79. Word Search
//MARK: 1.Think of it as a graph, we look for a (* path) that leads us to be the target  2. traverse all the coordinate in the graph as starting point  3. comparing chars one by one if some word in the middle was wrong return false immediately  4.(base case) if we reached the end of the word (index == word.count) meaning found the word
//let board: [[Character]] = [["A","B","C","E"],
//                            ["S","F","C","S"],
//                            ["A","D","E","E"]], word = "ABCCED"
//print(solution.exist(board, word))
//class Solution { // !nested function (pass by reference) this is faster? 400ms; can be improved using visited 150ms
//    func exist(_ board: [[Character]], _ word: String) -> Bool { // m X n; m >= 1   so board[0] will never out of bounds
//        let row = board.count
//        let col = board[0].count
////        var onPath = [(Int, Int)]() // onPath is used to finding a path
//        var visited = Array(repeating: Array(repeating: false, count: col), count: row) // more efficient to check if certain coordinate has visited
//        var wordArr = Array(word)
//        for r in 0..<row {
//            for c in 0..<col {
//                if dfs(board, r, c, &visited, 0, &wordArr) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//    func dfs(_ board: [[Character]],_ r: Int, _ c: Int, _ visited: inout [[Bool]], _ index: Int, _ word: inout [Character]) -> Bool {
//        if index == word.count {
//            return true
//        }
//        if r < 0 || c < 0 || r == board.count || c == board[0].count || visited[r][c] || board[r][c] != word[index] {
//            return false
//        }
////        onPath.append((r, c))
//        visited[r][c] = true
//        if  dfs(board, r+1, c, &visited, index + 1, &word) ||
//                dfs(board, r-1, c, &visited, index + 1, &word) ||
//                dfs(board, r, c+1, &visited, index + 1, &word) ||
//                dfs(board, r, c-1, &visited, index + 1, &word) {
//            return true
//        }
//        //        onPath.removeAll(where: {$0 == (r, c)}) // Same result but this is o(n)
////        onPath.removeLast() // o(1)
//        visited[r][c] = false
//        return false
//    }
//}

//class Solution { // use global variable 800ms
//    var onPath = [(Int, Int)]()
//
//    func exist(_ board: [[Character]], _ word: String) -> Bool { // m X n; m >= 1   so board[0] will never out of bounds
//        let row = board.count
//        let col = board[0].count
//        var wordArr = Array(word)
//
//        for r in 0..<row {
//            for c in 0..<col {
//                if dfs(board, r, c, 0, &wordArr) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//    func dfs(_ board: [[Character]], _ r: Int, _ c: Int, _ index: Int, _ target: inout [Character]) -> Bool {
//        if index == target.count {
//            return true
//        }
//        if r < 0 || c < 0 || r == board.count || c == board[0].count || onPath.contains(where: {$0 == (r, c)}) || board[r][c] != target[index] {
//            return false
//        }
//        onPath.append((r, c))
//        if  dfs(board, r+1, c, index + 1, &target) ||
//                dfs(board, r-1, c, index + 1, &target) ||
//                dfs(board, r, c+1, index + 1, &target) ||
//                dfs(board, r, c-1, index + 1, &target) {
//            return true
//        }
//        //        onPath.removeAll(where: {$0 == (r, c)}) // Same result but this is o(n)
//        onPath.removeLast() // o(1)
//        return false
//    }
//}

//class Solution { // nested function  1500ms
//    func exist(_ board: [[Character]], _ word: String) -> Bool { // m X n; m >= 1   so board[0] will never out of bounds
//        let row = board.count
//        let col = board[0].count
//        var onPath = [(Int, Int)]()
//        let wordArr = Array(word)
//        func dfs(_ r: Int, _ c: Int, _ index: Int) -> Bool {
//            if index == wordArr.count {
//                return true
//            }
//            if r < 0 || c < 0 || r == board.count || c == board[0].count || onPath.contains(where: {$0 == (r, c)}) || board[r][c] != wordArr[index] {
//                return false
//            }
//            onPath.append((r, c))
//            if  dfs(r+1, c, index + 1) ||
//                    dfs(r-1, c, index + 1) ||
//                    dfs(r, c+1, index + 1) ||
//                    dfs(r, c-1, index + 1) {
//                return true
//            }
//            //        onPath.removeAll(where: {$0 == (r, c)}) // Same result but this is o(n)
//            onPath.removeLast() // o(1)
//            return false
//        }
//        for r in 0..<row {
//            for c in 0..<col {
//                if dfs(r, c, 0) {
//                    return true
//                }
//            }
//        }
//        return false
//
//
//    }
//}

//MARK: - (Two pointers)(LinkedList)🟢83. Remove Duplicates from Sorted List
//class Solution { //24ms beats 88%
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        guard head != nil else {
//            return nil
//        }
//        let dummy:ListNode? = ListNode(Int.min)
//        var p1 = dummy
//        var p2 = head
//        while p2 != nil {
//            if p2?.val != p1?.val {
//                p1?.next = p2
//                p1 = p1?.next
//            }
//            p2 = p2?.next
//        }
//        p1?.next = nil
//        return dummy?.next
//    }
//}

//MARK: - 🟢88. Merge Sorted Array
//var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//solution.merge(&nums1, m, nums2, n)
//print(nums1)
//class Solution { //7ms beats 94%
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//        var p1 = m-1, p2 = n-1, index = m+n-1
//        while p1 >= 0 && p2 >= 0 {
//            if p2 >= 0 && nums2[p2] > nums1[p1] {
//                nums1[index] = nums2[p2]
//                p2 -= 1
//            } else {
//                nums1[index] = nums1[p1]
//                p1 -= 1
//            }
//            index -= 1
//        }
//        while p2 >= 0 {
//            nums1[index] = nums2[p2]
//            p2 -= 1
//            index -= 1
//        }
//    }
//}

//MARK: - 90. Subsets II
//let nums = [1,2,2] //[[],[1],[1,2],[1,2,2],[2],[2,2]]
//class Solution { 11ms beats 87%
//    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//        var track = [Int]()
//        let nums = nums.sorted()
//        func backtrack(_ start: Int) {
//            res.append(track)
//            for i in start..<nums.count {
//                if i > start && nums[i] == nums[i - 1] {
//                    print(i,start)
//                    continue
//                }
//                track.append(nums[i])
//                backtrack(i+1)
//                track.removeLast()
//            }
//        }
//        backtrack(0)
//        return res
//    }
//}

//MARK: - 🟡92. Reverse Linked List II
//let n1 = ListNode(1)
//let n2 = ListNode(2)
//let n3 = ListNode(3)
//let n4 = ListNode(4)
//let n5 = ListNode(5)
//n1.next = n2
//n2.next = n3
//n3.next = n4
//n4.next = n5
//
//let left = 2, right = 4
//let s = Solution()
//s.reverseBetween(n1, left, right)?.print()
//n5.print()
//class Solution {
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//        var current = head
//        var prev: ListNode? = nil
//        var count = 1
//        while count < left {
//            prev = current
//            current = current?.next
//            count += 1
//        }
//        let prevToReverse = prev
//        let headOfReverse = current
//        var temp = current?.next
//        while count < right {
////            current?.pValue()
//            temp = current?.next
//            current?.next = prev
//            prev = current
//            current = temp
//            count += 1
//            if count == right {
//                temp = current?.next
//            }
//        }
//        current?.next = prev
//        prevToReverse?.next = current
//        headOfReverse?.next = temp
////        prevToReverse?.pValue()
//        
//                
//        if left == 1 {
//            return current
//        } else {
//            return head
//        }
//    }
//}


//class Solution {
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//        var count = 1
//        var result = recursion(head?.next)
//        head?.next = result
//        var arr = [1,2,3,4,5]
//        let res = arr[1...4]
//        print(res)
//        func recursion(_ nextNode: ListNode?) -> ListNode? {
//            count += 1
//            if count == right {
//                return nextNode
//            }
//            recursion(nextNode?.next)?.next = nextNode
//            return recursion(nextNode?.next)
//        }
//        return head
//    }
//
//}

//MARK: - 🟢94. Binary Tree Inorder Traversal
//MARK: is better to pass by reference? faster?
//class Solution { // 0 ms
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var res = [Int]()
//        traverse(root, &res)
//        return res
//    }
//    func traverse(_ root: TreeNode?, _ res: inout [Int]) {
//        guard let root = root else {
//            return
//        }
//        traverse(root.left, &res)
//        res.append(root.val)
//        traverse(root.right, &res)
//    }
//}

//MARK: - 🟡98. Validate Binary Search Tree
//MARK: 1.helper method to find max of left and comparing to root.val and min of right 2.traverse the tree and make sure of conditions and recursively call it self
//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        guard let root = root else {
//            return true
//        }
//        if let left = root.left {
//            if maxVal(left) >= root.val {
//                return false
//            }
//        }
//        if let right = root.right {
//            if minVal(right) <= root.val {
//                return false
//            }
//        }
//        if isValidBST(root.left) && isValidBST(root.right) {
//            return true
//        } else {
//            return false
//        }
//    }
//    func minVal(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return Int.max
//        }
//        let minVal = min(minVal(root.left), minVal(root.right))
//        return min(root.val,minVal)
//
//    }
//    func maxVal(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return Int.min
//        }
//        let maxVal = max(maxVal(root.left), maxVal(root.right))
//        return max(root.val,maxVal)
//    }
//}
//MARK: - 🟢100. Same Tree
//MARK: same approach as post order but slightly different that if left is return false then it will return directly and won't go to next node.
//class Solution {
//    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        if p == nil, q == nil {
//            return true
//        }
//        if p?.val != q?.val {
//            return false
//        }
//
//        if !isSameTree(p?.left, q?.left) {
//            return false
//        }
//        if !isSameTree(p?.right, q?.right) {
//            return false
//        }
//        return true
//    }
//}

//MARK: - 🟡102. Binary Tree Level Order Traversal
//MARK: BFS from the root of the tree and iterate through the while loop, keep track of current length of the queue because this tells us how many node will be on this level and is counted by previous iteration. 2. make tempArray to collect all of result in current level and add next level's node to queue.
/// sample example:
//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        guard let root = root else { return [] }
//
//        var result: [[TreeNode]] = [[root]]
//        var array: [TreeNode] = [root]
//
//        while !array.isEmpty {
//            var temp: [TreeNode] = []
//
//            array.forEach { item in
//                if let left = item.left {
//                    temp.append(left)
//                }
//
//                if let right = item.right {
//                    temp.append(right)
//                }
//            }
//
//            array = temp
//
//            if !array.isEmpty {
//                result.append(array)
//            }
//        }
//
//        return result.map { $0.map { $0.val } }
//    }
//}
/// my solution
//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var q = [TreeNode?]()
//        var res = [[Int]]()
//        if root != nil {
//            q.append(root)
//        }
//        while !q.isEmpty {
//            let length = q.count
//            var levelRes = [Int]()
//            for _ in 0..<length {
//                let node = q.removeFirst()!
//                levelRes.append(node.val)
//                if node.left != nil {
//                    q.append(node.left)
//                }
//                if node.right != nil {
//                    q.append(node.right)
//                }
//            }
//            if !levelRes.isEmpty {
//                res.append(levelRes)
//            }
//        }
//        return res
//    }
//}

//MARK: - 🟢104. Maximum Depth of Binary Tree
//MARK: post order return after find the leftMax and rightMax
//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//        let leftMax = maxDepth(root.left) + 1
//        let rightMax = maxDepth(root.right) + 1
//        return max(leftMax,rightMax)
//    }
//}

//MARK: - 🟡105. Construct Binary Tree from Preorder and Inorder Traversal
//MARK: 1.map inorder array with index 2. first element of preorder is the root value of current tree 3. inorder will help us find the left portion and right portion
//let preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//let s = Solution()
//print(s.buildTree(preorder, inorder))
//class Solution {
//    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//        var inorderDict = [Int: Int]()
//        for i in 0..<inorder.count {
//            inorderDict[inorder[i]] = i
//        }
//        var preorderIndex = 0
//        return build(&inorderDict, &preorderIndex, preorder, left: 0, right: preorder.count - 1)
//    }
//    func build(_ dict: inout [Int: Int], _ preorderIndex: inout Int,_ preorder: [Int], left: Int, right: Int) -> TreeNode? {
//        guard left <= right else { return nil }
//        let root = TreeNode(preorder[preorderIndex])
//        let index = dict[preorder[preorderIndex]]!
//        preorderIndex += 1
//        root.left = build(&dict, &preorderIndex, preorder, left: left, right: index - 1)
//        root.right = build(&dict, &preorderIndex, preorder, left: index + 1, right: right)
//        return root
//    }
//}

//MARK: - 🟢108. Convert Sorted Array to Binary Search Tree
//let nums = [-10,-3,0,5,9]
//print(solution.sortedArrayToBST(nums)?.right?.val)
//class Solution { // 12ms
//    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//        traverse(nums, 0, nums.count - 1)
//    }
//    func traverse(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
//
////        if left > right {
////            return nil
////        }
//        guard left <= right else { //if left > right === guard left <= right (if is faster)
//            return nil
//        }
//        let mid = (left+right)/2
//        let root = TreeNode(nums[mid])
//        root.left = traverse(nums, left, mid-1)
//
//        root.right = traverse(nums, mid+1, right)
//
//        return root
//    }
//}

//MARK: - 🟢110. Balanced Binary Tree
//MARK: 1.traverse preorder for isBalanced for timeComplexity 2.traverse postorder for maxDepth of a node (we need to know it's left and right child's maxDepth to know current's max depth)
//class Solution {
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
//        let leftMaxDepth = maxDepth(root?.left)
//        let rightMaxDepth = maxDepth(root?.right)
//        if abs(leftMaxDepth - rightMaxDepth) > 1 {
//            return false
//        }
//        if !isBalanced(root?.left) {
//            return false
//        }
//        if !isBalanced(root?.right) {
//            return false
//        }
//        return true
//    }
//    func maxDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        let leftDepth = maxDepth(root?.left)
//        let rightDepth = maxDepth(root?.right)
//        return 1 + max(leftDepth, rightDepth)
//    }
//}

//MARK: - 🟢112.(Tree) Path Sum
//class Solution { // 29ms beats 98%
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//        traverse(root, targetSum, 0)
//    }
//    func traverse(_ root: TreeNode?, _ target: Int, _ parentSum: Int) -> Bool {
//        guard let root = root else {
//            return false
//        }
//        if root.left == nil && root.right == nil {
//            return parentSum + root.val == target
//        }
//        if traverse(root.left, target, parentSum + root.val) || traverse(root.right, target, parentSum + root.val) {
//            return true
//        }
//
//        return false
//    }
//}

//MARK: - 🟡114. Flatten Binary Tree to Linked List
//MARK: DP 1. convert left nodes to flat and store as temp1 and temp2 (fromLeft, fromRight) (don't attach to right yet, we might lose connection to it's right child) 2. attach left to root's right child, then travel down to the tail of right child and attach right root to the end. *This might not be the optimal solution but in a very clean way.
//class Solution { // 15ms beats 91%
//    //O(n)
//    func flatten(_ root: TreeNode?) {
//        dp(root)
//    }
//    func dp(_ root: TreeNode?) -> TreeNode? {
//        guard let root = root else {
//            return nil
//        }
//        let rootFromLeft = dp(root.left)
//        let rootFromRight = dp(root.right)
//
//        root.right = rootFromLeft
//        var p = root
//        while p.right != nil {
//            p = p.right!
//        }
//        p.right = rootFromRight
//        root.left = nil
//        return root
//    }
//}

//MARK: - 121. 🟢Best Time to Buy and Sell Stock (DP)
//let prices = [7,1,5,3,6]
//let solution = Solution()
//print(solution.maxProfit(prices))
//MARK: my solution (passed)
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var maxProfit = 0
//        var minPrice = prices[0]
//        for price in prices {
//            if price > minPrice {
//                let currentProfit = price - minPrice
//                maxProfit = max(maxProfit,currentProfit)
//            } else {
//                minPrice = price
//            }
//        }
//        return maxProfit
//    }
//}

//MARK:  retry (great)
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var right = 0
//        var maxProfit = 0
//        var minPrice = prices[0]
//        while right < prices.count {
//            let price = prices[right]
//            let purchase = prices[right]
//            right += 1
//            minPrice = min(minPrice,purchase)
//            let profit = price - minPrice
//            maxProfit = max(maxProfit, profit)
//        }
//        return maxProfit
//    }
//}
//MARK: dp solution (great)
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        let n = prices.count
//        var sell = 0, buy = Int.min
//        for i in 0..<n {
//            sell = max(sell, buy + prices[i])
//            buy = max(buy, -prices[i])
//        }
//
//        return sell
//    }
//}
//MARK: - 122. Best Time to Buy and Sell Stock II
//MARK: DP
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        let n = prices.count
//        var dp_i_0 = 0, dp_i_1 = Int.min
//        for i in 0..<n {
//            let temp = dp_i_0
//            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
//            dp_i_1 = max(dp_i_1, temp - prices[i])
//        }
//        return dp_i_0
//    }
//}

//MARK: - 🔴124. Binary Tree Maximum Path Sum
//MARK: 1.DP question rather than Tree question 2. make sure your state and selection ie: max(a,b) 3. traverse will help you find the max sum by its defination and look for left and right compare to zero meaning it gets larger or no then in the postorder to figure out the largest from left subtree and right subtree plus root itself 4. return value to return the root value plus larger path from left or right
//class Solution {
//    func maxPathSum(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return Int.min
//        }
//
//        var maxSum = Int.min
//        traverse(root, &maxSum)
//        return maxSum
//    }
//    func traverse(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
//        guard let root = root else {
//            return 0
//        }
//        let leftRes = max(0, traverse(root.left, &maxSum))
//        let rightRes = max(0, traverse(root.right, &maxSum))
//        maxSum = max(maxSum, leftRes + rightRes + root.val)
//        return max(leftRes, rightRes) + root.val
//    }
//}

//MARK: - 125. Valid Palindrome
//let s = "A          man, a plan, a canal: Panama"
//let solution = Solution()
//print(solution.isPalindrome(s))
////MARK: example solution
//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//
//        let arr = Array(s.lowercased())
//        var left = 0
//        var right = arr.count-1
//
//        while left<=right {
//
//            if !arr[left].isLetter && !arr[left].isNumber {
//                left+=1
//            } else if !arr[right].isLetter && !arr[right].isNumber {
//                right-=1
//            } else {
//
//                let leftChar = arr[left]
//                let rightChar = arr[right]
//
//                if leftChar != rightChar { return false }
//
//                left+=1
//                right-=1
//            }
//        }
//
//        return true
//    }
//}

//MARK: my Solution
//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//
//        var subString = [Character]()
//        for char in s.lowercased() {
//            if char.isLetter || char.isNumber{
//                subString.append(char)
//            }
//        }
//        print(subString)
//        for i in 0..<subString.count/2 {
//            if subString[i] != subString[subString.count-i-1] {
//                return false
//            }
//        }
//
//        return true
//    }
//
//}
//MARK: - 128. Longest Consecutive Sequence
//let nums = [1,2,0,1]
//let solution = Solution()
//print(solution.longestConsecutive(nums))
//MARK: my solution
//class Solution {
//    func longestConsecutive(_ nums: [Int]) -> Int {
//        if nums.count == 0 {
//            return 0
//        }
//        let sorted = nums.sorted()
//        print(sorted)
//        var highestConsecutive = 0
//        var counter = 1
//        for i in 0..<sorted.count {
//            let currentNum = sorted[i]
//            if i+1 != sorted.count { //not the last element
//                if currentNum + 1 == sorted[i+1]  {
//                    counter += 1
//                    print(counter)
//                } else if currentNum == sorted[i+1 ]{
//
//                } else {
//                    highestConsecutive = max(counter, highestConsecutive)
//                    counter = 1
//                }
//            }
//        }
//        if counter > highestConsecutive {
//            return counter
//        }
//        return highestConsecutive
//    }
//}

//MARK: - 🟡129. Sum Root to Leaf Numbers
//MARK: 1. DFS the entire tree and calculate the result when reach the leaf    2. find a way to transfer Int to String and concatenate with another "Int" and convert it back to int ie. 1+2 = "1" + "2" = "12" = 12
//class Solution { // 0ms beats 100%
//    var res = 0
//    func sumNumbers(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//
//        traverse(root, "")
//        return res
//    }
//    func traverse(_ root: TreeNode?,_ parentString: String) {
//        guard let root = root else {
//            return
//        }
//        if root.left == nil && root.right == nil { //leaf
//            let currentString = parentString + "\(root.val)"
//            res += Int(currentString)!
//        }
//        let currentString = parentString + "\(root.val)"
//        traverse(root.left, currentString)
//        traverse(root.right, currentString)
//    }
//}

//MARK: - 🟡131.(Backtrack) Palindrome Partitioning
//MARK: - DFS from starting position. key points: 1. Cut a word based on a range(start to iterating i) 2. check if word is palindrome
//let s = "aab"
//print(solution.partition(s))
//class Solution { // 773ms beats 98%
//    var res = [[String]]()
//    var path = [String]()
//    var word = [Character]()
//    func partition(_ s: String) -> [[String]] {
//        let s: [Character] = Array(s)
//        func backtrack(_ start: Int) {
//            if start == s.count { //reached end (all letters are used)
//                res.append(path)
//                return
//            }
//            for i in start..<s.count {
//
//                // cut out the word in 3 lines
//                let startIndex = s.index(s.startIndex, offsetBy: start)
//                let endIndex = s.index(s.startIndex, offsetBy: i)
//                word = Array(s[startIndex...endIndex])
//
//                if isValid(word) { // checking if word is valid
//                    path.append(String(word)) // standard 3 step (1.Make decision making)(2.next decision tree making)(3.undo decision)
//                    backtrack(i+1)
//                    path.removeLast()
//                }
//            }
//        }
//        backtrack(0)
//        return res
//    }
//
//    func isValid(_ str: [Character]) -> Bool {
//        var left = 0, right = str.count-1
//        while left <= right {
//            if str[left] != str[right] {
//                return false
//            }
//            left += 1
//            right -= 1
//        }
//        return true
//    }
//}

//MARK: - 🟡138. Copy List with Random Pointer
//MARK: my solution ( two pointer compare operater === )
//class Solution {
//    func copyRandomList(_ head: Node?) -> Node? {
////        var originalNodeArray = [(node: Node?, index: Int?)]() // tuple with index
////        var copyNodeArray = [Node?]()
//        var travelOriginalNode = head
//        var resultHeadNode: Node? = nil
////        if travelOriginalNode != nil {
////            resultHeadNode = Node(resultHeadNode!.val)
////        }
//        var travelCopyNode = resultHeadNode
//        var prev: Node? = nil
////        var nodeIndex = 0 //tag each Node with index
//        while travelOriginalNode != nil {
//            let newCopyNode = Node(travelOriginalNode!.val)
//            if resultHeadNode == nil {
//                resultHeadNode = newCopyNode
//            }
//            travelCopyNode = newCopyNode
//            prev?.next = newCopyNode
//            travelOriginalNode = travelOriginalNode?.next
//            prev = travelCopyNode
////            travelCopyNode = travelCopyNode?.next // to be nil?
//        }
//
//        //reset both list back to head
//        travelOriginalNode = head
//        travelCopyNode = resultHeadNode
//        while travelOriginalNode != nil {
//            if let ramdomNode = travelOriginalNode?.random {
//                var travelRandomNode = head
//                var travelRandomCopyNode = resultHeadNode
//                while travelRandomNode !== ramdomNode {
//                    travelRandomNode = travelRandomNode?.next
//                    travelRandomCopyNode = travelRandomCopyNode?.next
//                }
//                travelCopyNode?.random = travelRandomCopyNode
//            }
//            travelOriginalNode = travelOriginalNode?.next
//            travelCopyNode = travelCopyNode?.next
//        }
//
//
//        return resultHeadNode
//    }
//}

//MARK: - 🟢141. Linked List Cycle
//MARK: trick: use fast-slow pointer if there is a cycle then the fast will point to the slow
/// sample solution
//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//        guard head != nil else { return false }
//
//        var slow = head
//        var fast = head?.next
//
//        while !(slow === fast) {
//            slow = slow?.next
//            fast = fast?.next?.next
//
//            if slow == nil || fast == nil { return false }
//        }
//
//        return true
//    }
//}
//class Solution { //head = [3,2,0,-4], pos = 1
//    func hasCycle(_ head: ListNode?) -> Bool {
//        guard head != nil, head?.next != nil else {
//            return false
//        }
//        var arr = [ListNode]()
//        var travalNode = head
//        while travalNode != nil {
//            arr.append(travalNode!)
//            if let nextNode = travalNode?.next {
//                if arr.contains(where: { node in
//                    nextNode === node
//                }) {
//                    return true
//                }
//            }
//            travalNode = travalNode?.next
//        }
//
//        return false
//    }
//}

//MARK: - 143. Reorder List
//let n1 = ListNode(1)
//let n2 = ListNode(2)
//let n3 = ListNode(3)
//let n4 = ListNode(4)
//let n5 = ListNode(5)
//n1.next = n2
//n2.next = n3
//n3.next = n4
//n4.next = n5
//let solution = Solution()
//solution.reorderList(n1)
//n1.print()
//MARK: my solution(great)
//class Solution {
//    func reorderList(_ head: ListNode?) {
//        var travalNode = head
//        var nodeArr = [ListNode]()
//        while travalNode?.next != nil {
//            nodeArr.append(travalNode!)
//            travalNode = travalNode?.next
//        }
//        nodeArr.append(travalNode!)
//        for i in 0..<nodeArr.count / 2 {
//            nodeArr[i].next = nodeArr[nodeArr.count - 1 - i]
//            nodeArr[nodeArr.count-1-i].next = nodeArr[i+1]
//        }
//        nodeArr[nodeArr.count/2].next = nil
//    }
//}
//MARK: my solution 1 (correct but not effeicent)
//class Solution {
//    func reorderList(_ head: ListNode?) {
//        var startNode = head
//        var travalNode = head
//        while startNode != nil && startNode?.next != nil && startNode?.next?.next != nil {
//            while travalNode?.next?.next != nil {
//                travalNode = travalNode?.next
//            }
//            travalNode?.next?.next = startNode?.next
//            startNode?.next = travalNode?.next
//            startNode = travalNode?.next?.next
//            travalNode?.next = nil
//            travalNode = startNode
//        }
//    }
//}
//MARK: - 150. Evaluate Reverse Polish Notation
//
//let tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
//let s = Solution()
//print(s.evalRPN(tokens))
//MARK: my solution (passed) (great)
//class Solution {
//    func evalRPN(_ tokens: [String]) -> Int {
//        var numStack: [Int] = []
//        for item in tokens {
//            switch item {
//            case "*":
//                let num2 = numStack.removeLast()
//                let num1 = numStack.removeLast()
//                let result = num1 * num2
//                numStack.append(result)
//            case "/":
//                let num2 = numStack.removeLast()
//                let num1 = numStack.removeLast()
//                let result = num1 / num2
//                numStack.append(result)
//            case "+":
//                let num2 = numStack.removeLast()
//                let num1 = numStack.removeLast()
//                let result = num1 + num2
//                numStack.append(result)
//            case "-":
//                let num2 = numStack.removeLast()
//                let num1 = numStack.removeLast()
//                let result = num1 - num2
//                numStack.append(result)
//            default:
//                let num = Int(item)!
//                numStack.append(num)
//            }
//        }
//        return numStack[0]
//    }
//}

//MARK: - 153. Find Minimum in Rotated Sorted Array
//let nums = [3,4,5,1,2]
//let s = Solution()
//print(s.findMin(nums))
//MARK: my solution (passed) (great)
//class Solution {
//    func findMin(_ nums: [Int]) -> Int {
//        var left = 0
//        var right = nums.count - 1
//        var middle = (left+right) / 2
//        while left <= right {
//            middle = (left+right) / 2
//            if nums[left] > nums[right] {
//                if nums[middle] < nums[right] {
//                    if middle - 1 >= 0 && nums[middle-1] > nums[middle] {
//                        left = middle
//                    } else {
//                        right = middle - 1
//                    }
//                    right = middle - 1
//                } else {
//                    left = middle + 1
//                }
//            } else {
//                right = middle - 1
//            }
//        }
//        return nums[middle]
//    }
//}

//MARK: - 155. Min Stack


//MARK: my solution(great)
//class MinStack {
//
//    var stack = [Int]()
//    var minStack = [Int]()
//    var currentMin: Int?
//
//    init() {
//        stack = []
//    }
//
//    func push(_ val: Int) {
//        stack.append(val)
//        if let min = currentMin {
//            if val < min {
//                currentMin = val
//            }
//        } else {
//            currentMin = val
//        }
//        minStack.append(currentMin!)
//    }
//
//    func pop() {
//        stack.removeLast()
//        minStack.removeLast()
//        if minStack.isEmpty {
//            currentMin = nil
//            return
//        }
//        currentMin = minStack.last!
//    }
//
//    func top() -> Int {
//        return stack.last!
//    }
//
//    func getMin() -> Int {
//        return minStack.last!
//    }
//}

//MARK: - 🟢191. Number of 1 Bits
print(solution.hammingWeight(00000000000000000000001000001000))

class Solution { //0ms beats 100%
    func hammingWeight(_ n: Int) -> Int {
        var res = 0
        var n = n
        while n > 0 {
            print("n: \(n)")
            res += n % 2
            n /= 2
        }
        return res
    }
}

//MARK: - 🟡198. House Robber
//let nums = [2,1,1,2] // res: 4     //rob:    skip:3   ifRob:4
//print(solution.rob(nums))
//class Solution { // 0ms beats 100% interative (better?)
//    func rob(_ nums: [Int]) -> Int {
//        var rob = 0, skip = 0
//        for num in nums {
//            let ifRob = max(num + skip, skip)
//            skip = rob
//            rob = max(ifRob, rob)
//        }
//        return max(rob,skip)
//    }
//}

//class Solution { // 0ms beats 100% (Recursive)
//    func rob(_ nums: [Int]) -> Int {
//        let res = dp(nums, 0)
//        return max(res.rob, res.skip)
//    }
//    func dp(_ nums: [Int], _ start: Int) -> (rob: Int, skip: Int) {
//        if start == nums.count {
//            return (0, 0)
//        }
//        let next = dp(nums, start+1)
//        let rob = next.skip + nums[start]
//        let skip = next.rob
//        return (max(rob, skip), skip)
//    }
//}

//MARK: - 🟡199. Binary Tree Right Side View
//MARK: BFS 1.for each level and append to queue from right to left  2. set a bool or int variable to mark if we appended the level yet or not
//let tNode1 = TreeNode(1)
//let tNode2 = TreeNode(2)
//let tNode3 = TreeNode(3)
//let tNode4 = TreeNode(4)
//let tNode5 = TreeNode(5)
//tNode1.left = tNode2
//tNode1.right = tNode3
//tNode2.right = tNode5
//tNode3.right = tNode4
//let s = Solution()
//print(s.rightSideView(tNode1))
//class Solution {
//    func rightSideView(_ root: TreeNode?) -> [Int] {
//        var res = [Int]()
//        var q = [TreeNode?]()
//        if root != nil {
//            q.append(root)
//        }
//        while !q.isEmpty {
//            var count = 0
//            let length = q.count
//            for _ in 0..<length {
//                let cur = q.removeFirst()!
//                if count == 0 {
//                    res.append(cur.val)
//                    count += 1
//                }
//                if cur.right != nil {
//                    q.append(cur.right)
//                }
//                if cur.left != nil {
//                    q.append(cur.left)
//                }
//            }
//        }
//        return res
//    }
//}

//MARK: - 🟡213. House Robber II
//MARK: 1. Follow up from House Robber that the "houses" forms a circle  2. calculate result1 from 0 -> n-1 and result2 from 1 -> n and return max of two   3. This method works because we separated two cases that will `potientially` effect each other, so we come up with the correct answer.
//let nums = [2,3,2] //
//print(solution.rob(nums))
//class Solution { // 0ms beats 100% can be improved by combine two for loops
//    func rob(_ nums: [Int]) -> Int {
//        guard nums.count >= 2 else {
//            return nums[0]
//        }
//        var rob = 0, skip = 0
//        for i in 0..<nums.count - 1 {
//            let temp = nums[i] + skip
//            skip = rob
//            rob = max(rob, temp)
//        }
//        let res1 = max(rob, skip)
//        rob = 0
//        skip = 0
//        for i in 1..<nums.count {
//            let temp = nums[i] + skip
//            skip = rob
//            rob = max(rob, temp)
//        }
//        let res2 = max(rob, skip)
//        return max(res1, res2)
//    }
//}

//MARK: - 200. Number of Islands
//let grid: [[Character]] = [
//    ["1","1","0","0","0"],
//    ["1","1","0","0","0"],
//    ["0","0","1","0","0"],
//    ["0","0","0","1","1"]
//  ]
//let s = Solution()
//print(s.numIslands(grid)) // 3
//class Solution { // (recursive) //re attemp: 11/20
//    func numIslands(_ grid: [[Character]]) -> Int {
//        let row = grid.count, col = grid[0].count
//        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
//        var res = 0
//
//        func dfs(_ r: Int, _ c: Int) { // marking all neighbors // **Upgraded version is delete neighbor "1"s to "0"
//            if 0..<row ~= r && 0..<col ~= c && grid[r][c] == "1" && visited[r][c] == false { // inrange notation
//                visited[r][c] = true
//                dfs(r+1, c)
//                dfs(r-1, c)
//                dfs(r, c+1)
//                dfs(r, c-1)
//            }
//        }
//
//        for r in 0..<row {
//            for c in 0..<col {
//                if visited[r][c] == false && grid[r][c] == "1" {
//                    res += 1
//                    dfs(r, c)
//                }
//            }
//        }
//        return res
//    }
//}

//MARK: my solution (hinted) (BFS) (Iterative using Queue)
//class Solution {
//    func numIslands(_ grid: [[Character]]) -> Int {
//        let row = grid.count - 1
//        let column = grid[0].count - 1
//        var visitied: [[Int]:Int] = [:]
//        var result = 0
//        func bfs(_ r: Int,_ c: Int) {
//            var q: [[Int]] = []
//            visitied[[r,c], default: 0] += 1
//            q.append([r, c])
//            while !q.isEmpty {
//                let current = q.removeFirst() //deque Note: deque -> bfs , pop -> dfs
//                var newR = current[0]
//                var newC = current[1]
//                visitied[[newR,newC], default: 0] += 1
//                print("current:\(current)")
//                let directions = [[0,1],[0,-1],[1,0],[-1,0]] //right, left, down(opposite) , up(visually up)
//                for direction in directions {
//                    newR += direction[0]
//                    newC += direction[1]
//                    if 0...row ~= newR && 0...column ~= newC && grid[newR][newC] == "1" && visitied[[newR,newC]] == nil {
//                        q.append([newR,newC])
//                    }
//                }
//            }
//
//        }
//        for r in 0...row {
//            for c in 0...column {
//                if grid[r][c] == "1" && visitied[[r,c]] == nil{
//                    result += 1
//                    bfs(r, c)
//                }
//            }
//        }
//        return result
//
//    }
//}

//MARK: - 206. Reverse Linked List
//let node5 = ListNode(5,nil)
//let node4 = ListNode(4,node5)
//let node3 = ListNode(3,node4)
//let node2 = ListNode(2,node3)
//let node1 = ListNode(1,node2)
//let solution = Solution()
//let node = solution.reverseList(node1)
//node?.print()
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//MARK: attemp 2 (great)
//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard head != nil else {return nil}
//        var prev: ListNode? = nil
//        var headNode = head
//        while headNode?.next != nil {
//            let temp = headNode?.next
//            headNode?.next = prev
//            prev = headNode
//            headNode = temp
//        }
//        headNode?.next = prev
//        return headNode
//    }
//}
//MARK: iterative
//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var node = head
//        var arr = [ListNode]()
//        while node?.next != nil {
//            arr.append(node!)
//            node = node?.next
//        }
//        let newHead = node
//        for i in stride(from: arr.count - 1, to: -1, by: -1) {
//            node?.next = arr[i]
//            node = node?.next
//        }
//        node?.next = nil
//        return newHead
//    }
//}
//MARK: recurssive (passed but it's slower becuase calling itself creates bunch of stacks)
//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        if head?.next != nil {
//            let newNode = reverseList(head?.next)
//            let newAppend = ListNode(head!.val)
//            var current = newNode
//            while current?.next != nil {
//                current = current?.next
//            }
//            current?.next = newAppend
//            return newNode
//        } else {
//            if head == nil {
//                return nil
//            }
//            let newNode = ListNode(head!.val)
//            return newNode
//        }
//    }
//}

//MARK: - 🟡209. Minimum Size Subarray Sum
//MARK: very typical sliding window question maintain the framework and make shrink condition.
//let target = 11, nums = [1,1,1,1,1,1,1,1]
//let s = Solution()
//print(s.minSubArrayLen(target, nums))
//class Solution {
//    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
//        var right = 0, left = 0, total = 0
//        var res = Int.max
//        while right < nums.count {
//            let rightNumber = nums[right]
//            total += rightNumber
//            right += 1
//            while total >= target {
//                res = min(res,right - left)
//                total -= nums[left]
//                left += 1
//            }
//        }
//        return res != Int.max ? res : 0
//    }
//}
//MARK: - 🟢226. Invert Binary Tree
//MARK: prefix the tree make modification first then return at the postfix order
//class Solution {
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return nil
//        }
//        let temp = root?.left
//        root?.left = root?.right
//        root?.right = temp
//        invertTree(root?.left)
//        invertTree(root?.right)
//        return root
//    }
//}


//MARK: - 🟡230. Kth Smallest Element in a BST
//MARK: 1. inorder traverse a BST will give you ordered array 2. make helper method to pass around the rank var to keep track of which rank we are now.
//class Solution { // 54ms beats 98.9 %
//    var rank = 0
//    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        guard let root = root else {
//            return -1
//        }
//        let leftResult = kthSmallest(root.left,k)
//        rank += 1
//        if rank == k {
//            return root.val
//        }
//        let rightResult = kthSmallest(root.right,k)
//        return max(leftResult, rightResult)
//    }
//}
//class Solution { // return by Int
//    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        var rank = 0
//        return traverse(root, k, &rank)
//    }
//    func traverse(_ root: TreeNode?, _ k: Int, _ rank: inout Int) -> Int {
//        guard let root = root else {
//            return -1
//        }
//        var res = traverse(root.left, k, &rank)
//        if res != -1 {
//            return res
//        }
//        rank += 1
//        if rank == k {
//            return root.val
//        }
//        res = traverse(root.right, k, &rank)
//        if res != -1 {
//            return res
//        }
//        return -1
//    }
//}
//class Solution { // return by TreeNode?
//    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        var rank = 0
//        if let res = traverse(root, k, &rank) {
//            return res.val
//        } else {
//            return -1
//        }
//    }
//    func traverse(_ root: TreeNode?, _ k: Int, _ rank: inout Int) -> TreeNode? {
//        guard let root = root else {
//            return nil
//        }
//        var res = traverse(root.left, k, &rank)
//        if res != nil {
//            return res
//        }
//        rank += 1
//        if rank == k {
//            return root
//        }
//        res = traverse(root.right, k, &rank)
//        if res != nil{
//            return res
//        }
//        return nil
//    }
//}

//MARK: - 🟢234. Palindrome Linked List
//class Solution {
//    func isPalindrome(_ head: ListNode?) -> Bool { //tc O(n) sc O(1)
//        //fast-slow pointer
//        var slow = head, fast = head
//        while fast?.next != nil {
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//        //reverse second half list from slow(mid)
//        var prev: ListNode? = nil
//        while slow?.next != nil {
//            let temp = slow?.next
//            slow?.next = prev
//            prev = slow
//            slow = temp
//        }
//        slow?.next = prev
//
//        //start cheking
//        var left = head, right = slow
//        while left != nil && right != nil {
//            if left?.val != right?.val {
//                return false
//            }
//            left = left?.next
//            right = right?.next
//        }
//        return true
//    }
//}

//MARK: - 🟢235. Lowest Common Ancestor of a Binary Search Tree
//MARK: 1.make a contains function to make sure if current node is valid 2. travers the tree preorder first if current node is valid then try left and right node, but if current node fails just return directly(more effieient)
//class Solution {
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return nil
//        }
//        var res: TreeNode? = nil
//        if contains(root, p!.val) && contains(root, q!.val) {
//            res = root
//        } else {
//            return nil
//        }
//        if let node = lowestCommonAncestor(root?.left, p, q) {
//            res = node
//        }
//        if let node = lowestCommonAncestor(root?.right, p, q) {
//            res = node
//        }
//        return res
//
//    }
//    func contains(_ root: TreeNode?, _ val: Int) -> Bool {
//        if root == nil {
//            return false
//        }
//        if root?.val == val {
//            return true
//        }
//        if root!.val > val {
//            return contains(root?.left, val)
//        }
//        if root!.val < val {
//            return contains(root?.right, val)
//        }
//        return false
//    }
//}

//MARK: - 238. Product of Array Except Self
//let nums = [1,2,3,4]
//let solution = Solution()
//print(solution.productExceptSelf(nums))
//MARK: my solution(passed)
//class Solution { //carry the number along the way both   and backwards
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var result: [Int] = Array(repeating: 1, count: nums.count) //array initalizer with repeating as default value, and count is the size of the array
//
//        var prev = 1
//        for i in 0..<nums.count {
//            result[i] = prev
//            prev *= nums[i]
//        }
//        prev = 1
//        for i in stride(from: nums.count-1, to: -1, by: -1) {
//            result[i] *= prev
//            prev *= nums[i]
//        }
//
//        return result
//    }
//}

//MARK: - 167. Two Sum II - Input Array Is Sorted
//let numbers = [2,7,11,15], target = 9
//let solution = Solution()
//print(solution.twoSum(numbers, target))
//MARK: my solution (passed) (great)
//class Solution {
//    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
//        var dict = [Int:Int]()
//        for (index,number) in numbers.enumerated() {
//            let diff = target - number
//            if let num = dict[number] {
//                return [num+1,index+1]
//            } else {
//                dict[diff] = index
//            }
//        }
//        return []
//    }
//}

//MARK: - 239. Sliding Window Maximum
//let nums = [1,-1], k = 1
//let s = Solution()
//print(s.maxSlidingWindow(nums, k))
//MARK: my solution (can be improved by setting up a MAX Stack)
//class Solution {
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        var currentMax = nums[0]
//        let n = nums.count
//        var result = [Int]()
//        for i in 0..<k-1 {
//            currentMax = max(currentMax, nums[i])
////            print(i)
//        }
//        for index in k-1..<n {
////            print(index)
//            if index < k {
//                currentMax = max(currentMax, nums[index])
//                result.append(currentMax)
//            } else {
//                if nums[index-k] >= currentMax {
//                    let removedMax = currentMax
//                    currentMax = nums[index-(k-1)]
//                    for i in index-(k-1)...index { // look for another num that is equal
//                        currentMax = max(currentMax, nums[i])
//                        if nums[i] >= removedMax {
//                            currentMax = nums[i]
//                            break
//                        }
//                    }
//                } else {
//                    currentMax = max(currentMax, nums[index])
//                }
//                result.append(currentMax)
//            }
//        }
//        return result
//    }
//}

//MARK: - 242. Valid Anagram
//MARK: my solution (passed)
//class Solution {
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        var copyOfs = s
//        var ans = true
//        for char in t {
//            if copyOfs.contains(char) {
////                let index = copyOfs.firstIndex(of: char)
////                copyOfs.remove(at: index!)
//                copyOfs.remove(at: copyOfs.firstIndex(of: char)!)
//
//            } else {
//                ans = false
//            }
//        }
//        if copyOfs.isEmpty && ans{
//            return true
//        } else {
//            return false
//        }
//
//    }
//
//}

//MARK: - 🟢283. Move Zeroes
//class Solution { // 151 ms beats 100%
//    func moveZeroes(_ nums: inout [Int]) {
//        var left = 0, right = 0
//        while right < nums.count {
//            if nums[right] != 0 {
//                nums.swapAt(left, right)
//                left += 1
//            }
//            right += 1
//        }
//    }
//}

//MARK: - 309. Best Time to Buy and Sell Stock with Cooldown
//let prices = [1,2,3,0,2]
//let s = Solution()
//print(s.maxProfit(prices))
////MARK: my solution (*dp) (great)
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var dp_i_0 = 0
//        var dp_i_1 = Int.min
//        var dp_prev_0 = 0
//        for i in 0..<prices.count {
//            let temp = dp_i_0
//            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
//            print(dp_i_0)
//            dp_i_1 = max(dp_i_1, dp_prev_0 - prices[i])
//            print("*",dp_i_1)
//            dp_prev_0 = temp
//            print(dp_prev_0,"\n")
//        }
//        return dp_i_0
//    }
//}

//MARK: - 🟡337. House Robber III
//MARK: DFS this is actually a dp question that we need to do the smaller problem to solve the bigger one.
//print(solution.rob(tNode1)) //res: 23
//class Solution { //33ms beats 97%
//    func rob(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//        let res = traverse(root)
//        return max(res.withoutroot, res.withroot)
//    }
//    func traverse(_ root: TreeNode?) -> (withroot: Int, withoutroot: Int) {
//        guard let root = root else {
//            return (0,0)
//        }
//        let leftRes = traverse(root.left)
//        let rightRes = traverse(root.right)
//
//        let withroot = max(leftRes.withoutroot + rightRes.withoutroot + root.val, leftRes.withroot + rightRes.withroot)
//        let withoutroot = leftRes.withroot + rightRes.withroot
//        print(withroot, withoutroot)
//        return (withroot, withoutroot)
//    }
//}

//MARK: - 🟢344. Reverse String
//var s: [Character] = ["h","e","l","l","o"]
//solution.reverseString(&s)
//print(s)
//class Solution { // 145ms beats 97%
//    func reverseString(_ s: inout [Character]) {
//        var left = 0
//        var right = s.count - 1
//        while left < right {
//            s.swapAt(left, right)
//            left += 1
//            right -= 1
//        }
//    }
//}

//MARK: - 347. Top K Frequent Elements5
//var nums = [4,1,-1,2,-1,2,3], k = 2
//let solution = Solution()
//print(solution.topKFrequent(nums, k))
//MARK: my solution (passed)（great）
//class Solution {
//    var ans = [Int]()
//    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//        var dict = [Int:Int]()
//        for (_,item) in nums.enumerated() {
//            dict[item,default: 0] += 1
//        }
//        let sortedDict = dict.sorted { first, second in
//            return first.value > second.value
//        }
//        for i in 0..<k {
//            ans.append(sortedDict[i].key)
//        }
////        for i in 0..<k {  //Slows the algorithrm becuase we sort take a lot of resources
////            ans.append(dict.sorted(by: { first, second in
////                return first.value > second.value
////            })[i].key)
////        }
//        return ans
//    }
//}

//MARK: - 🟢414. Third Maximum Numbe
//print(solution.thirdMax([3,2,1]))
//
//class Solution { //23ms beats 91%
//    func thirdMax(_ nums: [Int]) -> Int {
//        let set = Set(nums)
//        let sortedSet = set.sorted()
//        guard sortedSet.count >= 3 else {
//            return sortedSet.last! //force unwrap since guaranteed have at least one number
//        }
//        return sortedSet[sortedSet.count-3]
//    }
//}

//MARK: - 🟡424. Longest Repeating Character Replacement
//let s = "AABABBA", k = 1
//let solution = Solution()
//print(solution.characterReplacement(s, k))
//MARK: sample solution (17ms)
//class Solution {
//    func characterReplacement(_ s: String, _ k: Int) -> Int {
//        var characterDictionary = [UInt16: Int]() // can also be [Character: Int]
//        var leftWindowIndex = 0
//        var largestWindowSize = 0
//        var longestString = 0
//        
//        let arraySlice = ArraySlice<UInt16>(s.utf16)
//        
//        for rightWindowIndex in 0..<arraySlice.count {
//            // making a const here to avoid accessing this twice and readability
//            let uint16CharacterCount = characterDictionary[arraySlice[rightWindowIndex], default: 0]
//            // increment character count
//            characterDictionary[arraySlice[rightWindowIndex]] = uint16CharacterCount + 1
//            // update largestWindowSize
//            largestWindowSize = max(largestWindowSize, uint16CharacterCount + 1)
//            
//            // if the window is larger than k, we need to increase the left index until it isn't
//            // once we reach the end of the array we no longer need to do this check
//            while rightWindowIndex - leftWindowIndex + 1 - largestWindowSize > k , leftWindowIndex != arraySlice.count {
//                characterDictionary[arraySlice[leftWindowIndex], default: 1] -= 1
//                leftWindowIndex += 1
//            }
//            
//            // update longest string based on the current window size
//            longestString = max(longestString, rightWindowIndex - leftWindowIndex + 1)
//        }
//        
//        return longestString
//    }
//}
//MARK: my solution
//class Solution {
//    func characterReplacement(_ s: String, _ k: Int) -> Int {
//        let array = Array(s)
//        var window:[Character:Int] = [:]
//        var res = 0
//        var maxf = 0
//        var left = 0
//        for i in 0..<s.count {
//            let rightChar = array[i]
//            window[rightChar, default: 0] += 1
//            let count = window[rightChar]!
//            maxf = max(maxf,count)
//            while (i - left - 1) - maxf > k {
//                window[array[left]]! -= 1
//                left += 1
//            }
//            res = max(res, (i-left)+1)
//        }
//
//        return res
//    }
//}

//MARK: - 🟡443. String Compression
//MARK: trick: (start from second) keep track of last repeated letter in the result and comparing through the array, if same count++ otherwise convert to String string = String(count) and append them to your result
//var chars: [Character] = ["a","a","a","a","a","a","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","b","c","c","c","c","c","c","c","c","c","c","c","c","c","c"]
//let s = Solution()
//print(s.compress(&chars))
//print(chars)
//class Solution {
//    func compress(_ chars: inout [Character]) -> Int {
//        var res = [Character]()
//        res.append(chars[0])
//        var lastOfRes = res.last!
//        var count = 1
//        for i in 1..<chars.count {
//            if chars[i] == lastOfRes {
//                count += 1
//////                let last = res.last!
//////                if last.isNumber {
//////                    let num = last.wholeNumberValue!
//////                    if num == 9 {
//////                        res.removeLast()
//////                        res.append("1")
//////                        res.append("0")
//////                    } else {
//////                        res.removeLast()
//////                        res.append(Character(String(num+1)))
//////                    }
//////                } else {
//////                    res.append("2")
//////                }
//            } else {
//                if count != 1 {
//                    let string = String(count)
//                    for char in string {
//                        res.append(char)
//                    }
//                }
//                count = 1
//                lastOfRes = chars[i]
//                res.append(chars[i])
//            }
//        }
//        if count != 1 {
//            let string = String(count)
//            for char in string {
//                res.append(char)
//            }
//        }
//        chars = res
//        return res.count
//    }
//}
//MARK: - 567. Permutation in String
//let s1 = "adc", s2 = "dcda"
//let s = Solution()
//print(s.checkInclusion(s1, s2))

//MARK: my solution (hinted)
//class Solution {
//    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//        guard s2.count >= s1.count else { return false}
//
//        let s1Array = Array(s1)
//        let s2Array = Array(s2)
//        var s1Count = Array(repeating: 0, count: 26)
//        var s2Count = Array(repeating: 0, count: 26)
//        let letterA: Character = "a"
//        let asciiValueOfA = letterA.asciiValue!
//
//        for i in 0..<s1Array.count {
//            s1Count[Int(s1Array[i].asciiValue! - asciiValueOfA)] += 1
//            s2Count[Int(s2Array[i].asciiValue! - asciiValueOfA)] += 1
//        }
//        var match = 0
//        for i in 0...25 {
//            if s1Count[i] == s2Count[i] {
//                match += 1
//            }
//        }
//        print(match)
//        for i in s1.count..<s2.count {
//            if match == 26 {
//                return true
//            }
//            var index = Int(s2Array[i].asciiValue! - asciiValueOfA)
//            s2Count[index] += 1
//            if s1Count[index] == s2Count[index] {
//                match += 1
//            } else if s1Count[index] + 1 == s2Count[index] {
//                match -= 1
//            }
//            index = Int(s2Array[i-s1.count].asciiValue! - asciiValueOfA)
//            s2Count[index] -= 1
//            if s1Count[index] == s2Count[index] {
//                match += 1
//            } else if s1Count[index] - 1 == s2Count[index] {
//                match -= 1
//            }
//        }
//
//
//        return match == 26
//    }
//
//}

//MARK: my solution(v1) (n^2)
//class Solution {
//    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//        for i in 0..<s2.count {
//            var tem1 = s1
//            var j = i
//            let index = s2.index(s2.startIndex, offsetBy: j)
//            var tem2 = s2[index...]
//            if tem2.count >= tem1.count {
//                while tem1.contains(tem2.first!) {
//                    tem1.remove(at: tem1.firstIndex(of: tem2.first!)!)
//                    let index = s2.index(s2.startIndex, offsetBy: j+1)
//                    tem2 = s2[index...]
//                    j += 1
//                    if tem1.isEmpty {
//                        return true
//                    }
//                }
//            }
//        }
//        return false
//    }
//}
//MARK: my solution (dictionary) works!
//class Solution { //"adc" "dcda"
//    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//        guard s2.count >= s1.count else { return false}
//        let array2 = Array(s2), array1 = Array(s1)
//        var window: [Character: Int] = [:]
//        var need: [Character: Int] = [:]
//        for char in s1 {
//            need[char, default: 0] += 1
//        }
//        var left = 0, right = 0
//        var valid = 0
//        while right < array2.count {
//            window[array2[right], default: 0] += 1
//            if window[array2[right]]! == need[array2[right]] ?? 0 {
//                valid += 1
//            }
//            while valid == need.count {
//                let char = array2[left]
//                window[char]! -= 1
//                if window[char]! + 1 == need[char] ?? -1 {
//                    valid -= 1
//                }
//                if right - left + 1 == array1.count {
//                    return true
//                }
//                left += 1
//            }
//            right += 1
//        }
//
//        return false
//    }
//}
//MARK: optimized solution (dictionary)
//class Solution {
//    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//        let array2 = Array(s2), array1 = Array(s1)
//        var window = [Character: Int]()
//        var need = [Character: Int]()
//        for c in s1 {
//            need[c, default: 0] += 1
//        }
//        var left = 0, right = 0, valid = 0
//        while right < array2.count {
//            let c = array2[right]
//            right += 1
//            if need[c, default: 0] > 0 {
//                window[c, default: 0] += 1
//                if window[c] == need[c] {
//                    valid += 1
//                }
//            }
//            while valid == need.count {
//                if right - left == array1.count {
//                    return true
//                }
//                let c = array2[left]
//                left += 1
//                if need[c, default: 0] > 0 {
//                    window[c, default: 0] -= 1
//                    if window[c, default: 0] < need[c, default: 0] {
//                        valid -= 1
//                    }
//                }
//            }
//        }
//
//        return false
//    }
//}

//MARK: - 🟢543. Diameter of Binary Tree
//MARK: postorder to update max diameter
//class Solution {
//    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        var res = 0
//        depth(root, &res)
//        return res
//    }
//    func depth(_ root: TreeNode?, _ maxDiameter: inout Int) -> Int {
//        if root == nil {
//            return 0
//        }
//        let leftDepth = depth(root?.left, &maxDiameter)
//        let rightDepth = depth(root?.right, &maxDiameter)
//
//        maxDiameter = max(maxDiameter, leftDepth + rightDepth)
//        return 1 + max(leftDepth, rightDepth)
//    }
//}

//MARK: - 🟢572. Subtree of Another Tree
//MARK: define a isSameTree(root, other) then check if current root is subtree if not then check left or right if none of these work then return false meaning that we treaversed all the node from root and none of it is subtree.
//class Solution {
//    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
//        if isSame(root, subRoot) {
//            return true
//        }
//        if root?.left != nil && isSubtree(root?.left, subRoot) {
//            return true
//        }
//        if root?.right != nil && isSubtree(root?.right, subRoot) {
//            return true
//        }
//        return false
//    }
//    func isSame(_ root: TreeNode?, _ other: TreeNode?) -> Bool {
//        if root == nil && other == nil {
//            return true
//        }
//        if root?.val != other?.val {
//            return false
//        }
//        if !isSame(root?.left, other?.left) {
//            return false
//        }
//        if !isSame(root?.right, other?.right) {
//            return false
//        }
//
//        return true
//
//    }
//}

//MARK: - 🟢606. Construct String from Binary Tree
// Input: root = [1,2,3,4]
// Output: "1(2(4))(3)"
//class Solution { // 63ms beats 100%
//    func tree2str(_ root: TreeNode?) -> String {
//        guard let root = root else {
//            return ""
//        }
//        if root.left == nil && root.right == nil { // leaf
//            return "\(root.val)"
//        }
//        let leftStr = tree2str(root.left)
//        let rightStr = tree2str(root.right)
//
//        if root.left != nil && root.right == nil {
//            return "\(root.val)(\(leftStr))"
//        }
//        if root.left == nil && root.right != nil {
//            return "\(root.val)()(\(rightStr))"
//        }
//        return "\(root.val)(\(leftStr))(\(rightStr))"
//    }
//}


//MARK: - 🟢617. Merge Two Binary Trees
//class Solution { // 97 ms beats 82%
//    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
//        if root1 == nil && root2 == nil {
//            return nil
//        }
//        // can be improved by adding if else then return the node directly
//        let val = (root1?.val ?? 0) + (root2?.val ?? 0)
//        let root = TreeNode(val)
//        root.left = mergeTrees(root1?.left, root2?.left)
//        root.right = mergeTrees(root1?.right, root2?.right)
//
//        return root
//    }
//}

//MARK: - 739. Daily Temperatures
//let temperatures = [73,74,75,71,69,72,76,73]
//let s = Solution()
//print(s.dailyTemperatures(temperatures))

//MARK: my solution
//class Solution {
//    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
//        var ans = [Int]()
//        var changes = [Int]()
//        for i in 0..<temperatures.count - 1 {
//            let change = temperatures[i+1] - temperatures[i]
//            changes.append(change)
//        }
//        print(changes)
//        for i in 0..<changes.count {
//            var accumulate = 0
//            var dayCount = 0
//            for j in i..<changes.count {
//                dayCount += 1
//                accumulate += changes[j]
//                if accumulate >= 1 {
//                    break
//                }
//            }
//            if accumulate >= 1 {
//                ans.append(dayCount)
//            } else {
//                ans.append(0)
//            }
//
//        }
//        ans.append(0)
//        return ans
//    }
//}

//MARK: - 🟡797. All Paths From Source to Target
//MARK: 1.dfs for each node to find a possible path to last node of the graph(n-1)   2. for if statement(checking correct result) there are three things to be sure a)reached last node. b)starting node is 0. c)Path is not empty otherwise it will crash when checking first node
//let graph = [[4,3,1],[3,2,4],[3],[4],[]]
//print(solution.allPathsSourceTarget(graph))
//class Solution { // 79ms beats 82%
//    var res = [[Int]]()
//    var onPath = [Int]()
//    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
//        for i in 0..<graph.count {
//            dfs(graph, i)
//        }
//        return res
//    }
//    func dfs(_ graph: [[Int]], _ index: Int) {
//        if index == graph.count - 1 && onPath.count > 0 && onPath[0] == 0 {
//            onPath.append(index)
//            res.append(onPath)
//            onPath.removeLast()
//            return
//        }
//        onPath.append(index)
//        for next in graph[index] {
//            dfs(graph, next)
//        }
//        onPath.removeLast()
//    }
//}


//MARK: - 853. Car Fleet
//let target = 10, position = [6,8], speed = [3,2]
//let s = Solution()
//print(s.carFleet(target, position, speed))
//MARK: my solution (hinted) (passed)
//class Solution {
//    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
//        var cars = [(position: Int, time: Double)]()
//        for i in 0..<position.count {
//            let time = Double((target - position[i]))/Double(speed[i])
//            cars.append((position: position[i], time: time))
//        }
//        cars = cars.sorted(by: { leftCar, rightCar in
//            return leftCar.position < rightCar.position
//        })
//        print(cars)
//
//        var result = [(position: Int, time: Double)]()
//        result.append(cars.last!)
//        for i in stride(from: cars.count - 2, through: 0, by: -1) {
//            if cars[i].time > result.last!.time {
//                result.append(cars[i])
//            }
//        }
//        print(result)
//        return result.count
//    }
//}

//MARK: - 🟡930. Binary Subarrays With Sum
//MARK: Note: Permutation of a substring works like this: (valid prefix + 1) * (valid postfix + 1) every front times every rear.
//let nums = [0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0], goal = 3
//print(solution.numSubarraysWithSum(nums, goal))
//class Solution { // sample solution
//    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
//        var map = [0: 1]
//        var res = 0
//        var sum = 0
//        for num in nums {
//            sum += num
//            if let count = map[-goal+sum] {
//                print("***   \(count)")
//                res += count
//            }
//            map[sum, default: 0] += 1
//            print(map, res)
//        }
//        return res
//    }
//}
//class Solution { // optimized beats 100%
//    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
//        let n = nums.count
//        var queue = [Int]()
//        var res = 0, oneCount = 0, zeroCount = 1
//        for i in 0..<n {
//            let num = nums[i]
//            if num == 0 {
//                zeroCount += 1
//            } else {
//                oneCount += 1
//                queue.append(zeroCount)
//                zeroCount = 1
//            }
//        }
//        queue.append(zeroCount)
//        guard queue.count > goal else {
//            return 0
//        }
//        if goal != 0 {
//            for i in goal..<queue.count {
//                res += queue[i-goal]*queue[i]
//            }
//        } else {
//            for var num in queue {
//                num -= 1
//                while num != 0 {
//                    res += num
//                    num -= 1
//                }
//            }
//        }
//
//        return res
//    }
//}
//class Solution { // beats 15%
//    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
//        let n = nums.count
//        var queue = [Int]()
//        var res = 0, left = 0, right = 0, oneCount = 0, zeroCount = 1
//        if goal != 0 {
//            for i in 0..<nums.count {
//                let num = nums[i]
//                if num == 0 {
//                    zeroCount += 1
//                } else {
//                    oneCount += 1
//                    queue.append(zeroCount)
//                    zeroCount = 1
//                    if oneCount == goal || oneCount > goal {
//                        let prefix = queue.removeFirst()
//                        var trailing = 1, right = i + 1
//                        while right < n && nums[right] != 1 {
//                            trailing += 1
//                            right += 1
//                        }
//                        print(prefix, trailing)
//                        res += prefix * trailing
//                    }
//                }
//            }
//        } else {
//            zeroCount = 0
//            for num in nums {
//                if num == 0 {
//                    zeroCount += 1
//                    res += zeroCount
//                } else {
//                    zeroCount = 0
//                }
//            }
//        }
//
//        return res
//    }
//}

//MARK: - 875. Koko Eating Bananas
//let piles = [3,6,7,11], h = 8
//let s = Solution()
//print(s.minEatingSpeed(piles, h))
//MARK: my solution (hinted)
//class Solution {
//    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
//        var left = 1
//        var right = piles.max()!
//        var k = piles.max()!
//        while left <= right {
//            let middle = (left+right) / 2
//            if isValidK(piles, h, middle) {
//                k = middle
//                right = middle - 1
//            } else {
//                left = middle + 1
//            }
//        }
//        return k
//    }
//    func isValidK(_ piles: [Int], _ h: Int,_ k: Int) -> Bool {
//        var totalTime = 0.0
//        for i in 0..<piles.count {
//            totalTime += ceil(Double(piles[i])/Double(k))
//        }
//        if totalTime > Double(h) {
//            return false
//        } else {
//            return true
//        }
//    }
//}

//MARK: - 981. Time Based Key-Value Store

//MARK: my solution (great)
//class TimeMap {
//
//    var pairArray: [(String,String)]
//    var timeStamps = [Int]()
//    init() {
//        pairArray = []
//    }
//
//    func set(_ key: String, _ value: String, _ timestamp: Int) {
//        pairArray.append((key,value))
//        timeStamps.append(timestamp)
//    }
//
//    func get(_ key: String, _ timestamp: Int) -> String {
//        var left = 0
//        var right = pairArray.count - 1
//        var middle = (left+right) / 2
//        var target: Int?
//        while left <= right {
//            middle = (left+right) / 2
//            if timeStamps[middle] <= timestamp {
//                target = middle
//            }
//            if timestamp > timeStamps[middle]{
//                left = middle + 1
//            } else {
//                right = middle - 1
//            }
//        }
//        var result = ""
//        if let target = target {
//            for i in stride(from: target, through: 0, by: -1) {
//                        if key == pairArray[i].0 {
//                            result = pairArray[i].1
//                            break
//                        }
//                    }
//        }
//
//        return result
//    }
//}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */

//MARK: - 🟢1128. Number of Equivalent Domino Pairs
//print(solution.numEquivDominoPairs([[1,2],[1,2],[1,1],[1,2],[2,2]]))
//class Solution { //160ms beats 100%
//    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
//        //          Pair:frequency
//        var hashMap = [[Int]: Int]()
//        var result = 0
//        for pair in dominoes {
//            let sortedPair = pair.sorted()
//            if let frequency = hashMap[sortedPair] {
//                result += frequency
//                hashMap[sortedPair] = frequency + 1
//            } else {
//                hashMap[sortedPair] = 1
//            }
//        }
//        return result
//    }
//}

//MARK: - 🟢1221. Split a String in Balanced Strings
//MARK: intuitive and easy. make left and right counter
//let s = "RLRRLLRLRL"
//let so = Solution()
//print(so.balancedStringSplit(s))
//class Solution {
//    func balancedStringSplit(_ s: String) -> Int {
//        let str = Array(s)
//        var leftCount = 0, rightCount = 0
//        var res = 0
//        for char in str {
//            if char == "L" {
//                leftCount += 1
//                if leftCount == rightCount && leftCount != 0 {
//                    leftCount = 0
//                    rightCount = 0
//                    res += 1
//                }
//            } else {throw new Error(`${source.name}.${_.lowerFirst(Type.name)} called with something that's not a subclass of Sequelize.Model`);
//                rightCount += 1
//                if leftCount == rightCount && leftCount != 0 {
//                    leftCount = 0
//                    rightCount = 0
//                    res += 1
//                }
//            }
//        }
//        return res
//    }
//}

//MARK: - 🟢1370. Increasing Decreasing String
//print(solution.sortString("aaaabbbbcccc"))
//class Solution { // 46ms beats 100%
//    func sortString(_ s: String) -> String {
//        guard !s.isEmpty else {
//            return ""
//        }
//        var s: [Character] = s.sorted()
//        var picked = Array(repeating: false, count: s.count)
//        var result = [Character]()
//        while result.count < s.count {
//            increasing(&s, &result, &picked)
//            decreasing(&s, &result, &picked)
//        }
//        return String(result)
//    }
//    func increasing(_ s: inout [Character], _ result: inout [Character], _ picked: inout [Bool]) {
//        var currentSmall: Character?
//        for (index, char) in s.enumerated() {
//            if !picked[index] {
//                if let smallest = currentSmall {
//                    if char > smallest {
//                        picked[index] = true
//                        currentSmall = char
//                        result.append(char)
//                    }
//                } else {
//                    picked[index] = true
//                    currentSmall = char
//                    result.append(char)
//                }
//            }
//        }
//    }
//    func decreasing(_ s: inout [Character], _ result: inout [Character], _ picked: inout [Bool]) {
//        var currentLarge: Character?
//        for index in stride(from: s.count-1, through: 0, by: -1) {
//            if !picked[index] {
//                let char = s[index]
//                if let largest = currentLarge {
//                    if char < largest {
//                        picked[index] = true
//                        currentLarge = char
//                        result.append(char)
//                    }
//                } else {
//                    picked[index] = true
//                    currentLarge = char
//                    result.append(char)
//                }
//            }
//        }
//    }
//}

//MARK: - 🟡1415. The k-th Lexicographical String of All Happy Strings of Length n
//print("result: \(solution.getHappyString(3, 9))")
//class Solution { //20ms beats 100%
//    func getHappyString(_ n: Int, _ k: Int) -> String {
//        var happyStrings = [String]()
//        func generateAllStrings(_ aCount: Int, _ bCount: Int,_ cCount: Int,_ currentString: String) {
//            if aCount + bCount + cCount == n {
//                happyStrings.append(currentString)
//                return
//            }
//            if let lastLetter = currentString.last {
//                if lastLetter != "a" {
//                    generateAllStrings(aCount+1,bCount,cCount,"\(currentString)a")
//                }
//                if lastLetter != "b" {
//                    generateAllStrings(aCount,bCount+1,cCount,"\(currentString)b")
//                }
//                if lastLetter != "c" {
//                    generateAllStrings(aCount,bCount,cCount+1,"\(currentString)c")
//                }
//            } else {
//                generateAllStrings(aCount+1,bCount,cCount,"\(currentString)a")
//                generateAllStrings(aCount,bCount+1,cCount,"\(currentString)b")
//                generateAllStrings(aCount,bCount,cCount+1,"\(currentString)c")
//            }
//        }
//        generateAllStrings(0, 0, 0, "")
//        happyStrings.sort()
//        return k <= happyStrings.count ? happyStrings[k-1] : ""
//    }
//}
//MARK: - 🟡1448. Count Good Nodes in Binary Tree
//MARK: 1.inorder traversal if current node is a goode node and plus the left total good node and right total good node
//print(solution.goodNodes(nil))
//class Solution { // root = [3,1,4,3,null,1,5]
//    func goodNodes(_ root: TreeNode?) -> Int {
//        return traverse(root, Int.min)
//    }
//    func traverse(_ root: TreeNode?, _ parentVal: Int) -> Int{
//        guard let root = root else {
//            return 0
//        }
//        var res = 0
//        if root.val >= parentVal { //good node
//            res += 1
//        }
//        if root.left != nil {
//            res += traverse(root.left, max(root.val, parentVal))
//        }
//        if root.right != nil {
//            res += traverse(root.right, max(root.val, parentVal))
//        }
//        return res
//    }
//}

//MARK: - 🟢1512. Number of Good Pairs
//MARK: HashMap
//let nums = [1,2,3,1,1,3]
//print(solution.numIdenticalPairs(nums))
//class Solution {
//    func numIdenticalPairs(_ nums: [Int]) -> Int {
//        var map = [Int: Int]()
//        var res = 0
//        for num in nums {
//            if let count = map[num] {
//                print(count)
//                res += count
//                map[num] = count + 1
//            } else {
//                map[num] = 1
//            }
//        }
//        return res
//    }
//}

//MARK: - 🟡1513. Number of Substrings With Only 1s
//MARK: Ramanujan Summation that adds up the number from 1 to n (correspond to permutation of same element)
//let s = "0110111"
//print(solution.numSub(s))
//class Solution {
//    func numSub(_ s: String) -> Int {
//        let str = Array(s)
//        var oneCount = 0, res = 0
//        for char in str {
//            switch char {
//            case "1":
//                oneCount += 1
//                res += oneCount
//            case "0":
//                oneCount = 0
//            default:
//                break
//            }
//        }
//        return res % 1000000007
//    }
//}

//MARK: - 1838. Frequency of the Most Frequent Element
//let nums = [1,4,8,13], k = 5
//let s = Solution()
//print(s.maxFrequency(nums, k))
//class Solution { // correct, not effeicent
//    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
//        let nums: [Int] = nums.sorted()
//        var res = 0
//        var left = 0, right = 0, total = 0
//        while right < nums.count {
//            total += nums[right]
//            right += 1
//            while (right-left)*nums[right - 1] > total + k {
//                total -= nums[left]
//                left += 1
//            }
//            res = max(res, right - left + 1)
//        }
//        return res
//    }
//}
//class Solution {
//    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
//        let sorted: [Int] = nums.sorted()
//        var res = 1
//        for r in stride(from: sorted.count - 1, through: 0, by: -1) {
//            var l = r
//            var cost = k
//            while l > 0 {
//                l -= 1
//                if l != -1 { //base case
//                    let gap = sorted[r] - sorted[l]
//                    if cost - gap >= 0 {
//                        cost -= gap
//                        res = max(res, r - l + 1)
//                    } else {
//                        break
//                    }
//                }
//            }
//        }
//        return res
//    }
//}

//MARK: - 🟡2516. Take K of Each Character From Left and Right
//print(solution.takeCharacters("aabaaaacaabc", 2))
//
//class Solution {
//    func takeCharacters(_ s: String, _ k: Int) -> Int {
//        guard k != 0 else {
//            return 0
//        }
//        let s: [Character] = Array(s)
//        var lettersFromRightAt = [Int: [Int]]()
//        //Validate possible output
//        var a = 0, b = 0, c = 0
//        var shouldProceed = false
//        for index in stride(from: s.count-1, through: 0, by: -1) {
//            let char = s[index]
//            switch char {
//            case "a":
//                a += 1
//            case "b":
//                b += 1
//            case "c":
//                c += 1
//            default:
//                break
//            }
//            lettersFromRightAt[index] = [a, b, c]
//            if a >= k && b >= k && c >= k {
//                shouldProceed = true
//            }
//        }
//        print(lettersFromRightAt)
//
//        if !shouldProceed {
//            return -1
//        }
//        //Actual solution
//        a = 0; b = 0; c = 0
//        var result = Int.max
//        func minRequiredMinuteFrom(left: Int, right: Int) -> Int {
//            if a >= k && b >= k && c >= k {
//                return left
//            }
//            print(a,b,c)
//            let index = left
//            var targetIndex = 0, left = left, right = right
//            while left <= right {
//                targetIndex = (left+right)/2
//                print("left: \(left) mid: \(targetIndex) right: \(right)")
//                let letterCounts = lettersFromRightAt[targetIndex]!
//                if a+letterCounts[0] >= k && b+letterCounts[1] >= k && c+letterCounts[2] >= k {
//                    left = targetIndex + 1
//                } else {
//                    right = targetIndex - 1
//                }
//            }
//            targetIndex = (left+right)/2
//            print("target\(targetIndex)")
//            print("min \((s.count-targetIndex)+index)")
//            return (s.count-targetIndex)+index
//        }
//        for index in 0..<s.count {
//            let char = s[index]
//            result = min(result, minRequiredMinuteFrom(left: index, right: s.count - 1))
//            switch char {
//            case "a":
//                a += 1
//            case "b":
//                b += 1
//            case "c":
//                c += 1
//            default:
//                break
//            }
//        }
//        return result
//    }
//}

//class Solution { //Backtracking solution: Does work but Time Limit Exceeded
//    func takeCharacters(_ s: String, _ k: Int) -> Int {
//        let s: [Character] = Array(s)
//        func backtrack(_ a: Int, _ b: Int, _ c: Int, _ left: Int, _ right: Int, _ minute: Int) -> Int {
//            if a >= k && b >= k && c >= k {
//                if minute <= 8 {
//                    print(a,b,c, "min: \(minute)")
//                }
//                return minute
//            }
//            if left > right {
//                return -1
//            }
//            var result = Int.max
//
//            let leftChar = s[left]
//            switch leftChar {
//            case "a":
//                result = min(result, backtrack(a+1, b, c, left+1, right, minute+1))
//            case "b":
//                result = min(result, backtrack(a, b+1, c, left+1, right, minute+1))
//            case "c":
//                result = min(result, backtrack(a, b, c+1, left+1, right, minute+1))
//            default:
//                break
//            }
//
//            let rightChar = s[right]
//            switch rightChar {
//            case "a":
//                result = min(result, backtrack(a+1, b, c, left, right-1, minute+1))
//            case "b":
//                result = min(result, backtrack(a, b+1, c, left, right-1, minute+1))
//            case "c":
//                result = min(result, backtrack(a, b, c+1, left, right-1, minute+1))
//            default:
//                break
//            }
//            return result
//        }
//        return backtrack(0, 0, 0, 0, s.count-1, 0)
//    }
//}

//MARK: - 🟢2574. Left and Right Sum Differences
//print(solution.leftRigthDifference([10,4,8,3]))
//
//class Solution { //42ms beats 96%
//    func leftRigthDifference(_ nums: [Int]) -> [Int] {
//        var leftSum = [Int]()
//        var rightSum = Array(repeating: 0, count: nums.count)
//        nums.reduce(0) {
//            leftSum.append($0)
//            return $0 + $1
//        }
//        var sum = 0
//        for i in stride(from: nums.count-1, through: 0, by: -1) {
//            rightSum[i] = sum
//            sum += nums[i]
//        }
//        return nums.indices.map { abs(leftSum[$0] - rightSum[$0]) }
//    }
//}

//MARK: - Other Practice
//MARK: Amazon OA question 2 | sliding window question 
//let stockPrice = [1,2,7,7,4,3,6], k = 3
//let s = Solution()
//print(s.findMaxSum(stockPrice, k))
//class Solution {
//    func findMaxSum(_ stockPrice: [Int],_ k: Int) -> Int {
//        var left = 0, right = 0, res = -1
//        var map = [Int: Int]()
//        while right < stockPrice.count {
//            let rightPrice = stockPrice[right]
//            map[rightPrice, default: 0] += 1
//            while right - left >= k {
//                let leftPrice = stockPrice[left]
//                print(leftPrice)
//                if map[leftPrice]! == 1 {
//                    map.removeValue(forKey: leftPrice)
//                } else {
//                    map[leftPrice]! -= 1
//                }
//                left += 1
//            }
//            if map.count == k { // no duplicates
//                let sum = map.reduce(0) { partialResult, pair in // reduce function to calculate valid sum
//                    partialResult + pair.key
//                }
//                res = max(res, sum)
//            }
//            right += 1
//        }
//        return res
//    }
//}

//MARK: - Hackerrank
//MARK: - timeConversion (Passed)
//MARK: 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock. - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.
//print(solution.timeConversion(s: "12:00:00AM"))
//class Solution {
//    func timeConversion(s: String) -> String {
//        // Write your code here
//        let str = Array(s)
//        let AorP: Character = str[str.count-2]
//        var hour: String = "\(str[0])\(str[1])"
//        let min = "\(str[3])\(str[4])"
//        let second = "\(str[6])\(str[7])"
//        var hourInt = Int(hour)!
//        if AorP == "A" {
//            if hour == "12" {
//                hour = "00"
//            }
//            return "\(hour):\(min):\(second)"
//        } else {
//            if hour != "12" {
//                hourInt += 12
//            }
//            hour = "\(hourInt)"
//            return "\(hour):\(min):\(second)"
//        }
//    }
//}

//MARK: - matchingStrings
//MARK: use HashMap
//let strings = ["aba","baba","aba","xzxb"]
//let queries = ["aba","xzxb","ab"]
//func matchingStrings(strings: [String], queries: [String]) -> [Int] {
//    var res = [Int]()
//    var map = [String: Int]()
//    for string in strings {
//        map[string, default: 0] += 1
//    }
//    for query in queries {
//        if let count = map[query] {
//            res.append(count)
//        } else {
//            res.append(0)
//        }
//    }
//    return res
//}

//MARK: - lonelyinteger
//func lonelyinteger(a: [Int]) -> Int {
//    var map = [Int: Int]()
//    for num in a {
//        map[num, default: 0] += 1
//    }
//    // for num in a {
//    //     if let count = map[num] {
//    //         if count == 1 {
//    //             return num
//    //         }
//    //     }
//    // }
//    let res = map.filter({ return $0.value == 1})
//    for key in res.keys {
//        return key
//    }
//    return 0
//}

//MARK: - flippingBits
//print(solution.flippingBits(n: 1))
//class Solution {
//    func flippingBits(n: Int) -> Int {
//        var arr = Array(repeating: 0, count: 32)
//        var varN = n
//        var index = 0
//        var res = 0
//        while varN != 0 {
//            let remainder = varN % 2
//            arr[index] = remainder
//            index += 1
//            varN /= 2
//        }
//        for i in 0..<arr.count {
//            arr[i] = arr[i] == 1 ? 0 : 1
//        }
//        var valueAtIndex = 1
//        for i in 0..<arr.count {
//            valueAtIndex *= i != 0 ? 2 : 1
//            res += arr[i] == 1 ? valueAtIndex : 0
//        }
//        print(valueAtIndex)
//        return res
//    }
//}

//MARK: - diagonalDifference
//MARK: the question will always provide a n x n matrix 2. zp meaning leftbutton to rightupper | qm meaning leftupper to rightbutton
//print(solution.diagonalDifference(arr: [[11,2,4],  //0
//                                        [4,5,6],  //1
//                                        [10,8,-12]]))//2
//class Solution {
//    func diagonalDifference(arr: [[Int]]) -> Int {
//        let side = arr.count
//        var zp = 0
//        var qm = 0
//        for i in 0..<side {
//            qm += arr[i][i]
//        }
//        var j = 0
//        for i in stride(from: side - 1, through: 0, by: -1) {
//            zp += arr[i][j]
//            j += 1
//        }
//        return abs(zp - qm)
//    }
//}

//MARK: - countingSort
//class Solution {
//    func countingSort(arr: [Int]) -> [Int] {
//        var res = Array(repeating: 0, count: 100)
//        for num in arr {
//            res[num] += 1
//        }
//        return res
//    }
//}

//MARK: - pangrams ( Array 26 letter count ) check if all the letter used at least once
//class Solution {
//    func pangrams(s: String) -> String {
//        // Write your code here
//        let lowercased = s.lowercased()
//        let A: Character = "a"
//        let asciiOfA = Int(A.asciiValue!)
//        var array = Array(repeating: 0, count: 26)
//        var isPangrams = true
//        for letter in lowercased {
//            if !letter.isWhitespace {
//                let index = Int(letter.asciiValue!) - asciiOfA
//                array[index] += 1
//            }
//        }
//        for count in array {
//            if count == 0 {
//                isPangrams = false
//            }
//        }
//        return isPangrams ? "pangram" : "not pangram"
//    }
//}

//MARK: - twoArrays ( sort A increasing order, sort B decreasing order,  checking positions add up greater than k or not )
//class Solution {
//    func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
//        // Write your code here
//        let A = A.sorted()
//        var B = B.sorted()
//        B.reverse()
//
//        for i in 0..<A.count {
//            if A[i] + B[i] < k {
//                return "NO"
//            }
//        }
//        return "YES"
//    }
//}

//MARK: - birthday (SlidingWindow)
//class Solution {
//    func birthday(s: [Int], d: Int, m: Int) -> Int {
//        // Write your code here
//        var res = 0, left = 0, right = 0, sum = 0
//        while right < s.count {
//            sum += s[right]
//            right += 1
//            if right - left == m && sum == d {
//                res += 1
//            }
//            while right - left >= m || sum > d {
//                sum -= s[left]
//                left += 1
//            }
//        }
//        return res
//    }
//}

//MARK: - sockMerchant
//class Solution {
//    func sockMerchant(n: Int, ar: [Int]) -> Int {
//        // Write your code here
//        var map = [Int: Int]()
//        var res = 0
//        for color in ar {
//            if let count = map[color] {
//                res += count % 2 == 1 ? 1 : 0
//                map[color] = count + 1
//            } else {
//                map[color] = 1
//            }
//        }
//        return res
//    }
//}

//MARK: - encryptString
//class Solution {
//    func caesarCipher(s: String, k: Int) -> String {
//        // Write your code here
//        let s: [Character] = Array(s)
//        let k = k % 26 //k can be greater than 26
//        var res = ""
//        for char in s {
//            if char.isLetter {
//                let ascii = Int(char.asciiValue!)
//                let targetAscii: Int
//                if char.isUppercase { // 65...90
//                    targetAscii = ascii + k > 90 ? ascii + k - 26 : ascii + k
//                } else { // 97...122
//                    targetAscii = ascii + k > 122 ? ascii + k - 26 : ascii + k
//                }
//                print(targetAscii)
//                let encrypted = UnicodeScalar(targetAscii)!
//                res += String(encrypted)
//            } else {
//                res += String(char)
//            }
//        }
//        return String(res)
//    }
//}

//MARK: - mock test 1 (greatest upper left quadrant)
//MARK: 119 compare to it's possible opponent: 119(0,3) VS 112(0,0), 62(3,0), 108(3,3) | 56 VS 49, 43, 15 | same for 125 VS 56, 78, 101
//M = [
//   112    42    83   (119)
//  (56)   (125)  56    49
//   15     78    101   43
//   62     98   (114)  108
//];
//MARK: OA: triangle problem
//let x1 = 3, y1 = 3     //                          *B(4,5)
//let x2 = 4, y2 = 5    //                       a            b
//let x3 = 7, y3 = 3    //                    *A(3,3)   c     C(7,3)
//let p1x = 4, p1y = 4
//let p2x = 100, p2y = 100
//// return 0: not valid triangle,
////1: point 1 lies within Triangle but not point 2,
////2: reverse of Option(1)
////3: both in triangle
////4: both circle are outside of triangle
//validPosition(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3, p1x: p1x, p1y: p1y, p2x: p2x, p2y: p2y)
//func validPosition(x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, p1x: Int, p1y: Int, p2x: Int, p2y: Int) -> Int {
//    let A = (x: x1,y: y1)
//    let B = (x: x2,y: y2)
//    let C = (x: x3,y: y3)
//    let P1 = (x: p1x,y: p1y)
//    let P2 = (x: p2x,y: p2y)
//    let a = getLength(x1: A.x, y1: A.y, x2: B.x, y2: B.y)//line between AB
//    let b = getLength(x1: B.x, y1: B.y, x2: C.x, y2: C.y)//line between BC
//    let c = getLength(x1: C.x, y1: C.y, x2: A.x, y2: A.y)//line between CA
//    print(a,b,c)
//
//    return 0
//}
//func getArea(x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int) -> Double {
//    return Double(1/2)/Double(x1)
//}
//let diff = (CFAbsoluteTimeGetCurrent() - start) * 1000
//print("\n\n\(diff) ms")


//MARK: - Basta-GSWEP
//Example:
//Input:  ATTAG
//Output: TAATC
//public func correspondDNA(_ input: String) -> String {
//    var res = ""
//    for char in input {
//        switch char {
//        case "A":
//            res += "T"
//        case "T":
//            res += "A"
//        case "C":
//            res += "G"
//        case "G":
//            res += "C"
//        default:
//            fatalError("Unexpected input")
//        }
//    }
//    return res
//}
//Examples:
//A = abc|xyz
//B = pqr|cba
//Answer: true (cut after index 2).
//
//A = abccb|z
//B = pqrsw|a
//Answer: true (cut after index 4).

