//  Created by Huang Yan on 8/19/22.

import Foundation
//MARK: playing around stack and queue
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//stack.push(4)
//print(stack.pop())
//print(stack.count)
//print(stack.last?.value)
//MARK: - 1. Two Sum
//let nums = [3,2,4], target = 6
//let solotion = Solution()
//print(solotion.twoSum(nums, target))
//MARK: sample version
//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//        var check: [Int:Int] = [:]
//        for (index, item) in nums.enumerated(){
//            let diff = target - item
//            // print("target = \(target), item = \(item), diff = \(diff)")
//            // print(String(describing: check[item]))
//
//            if let pre_index = check[item] {
//                return [pre_index, index]
//            } else {
//                check[diff] = index
//            }
//
//            // print(check)
//        }
//
//        return []
//
//    }
//}

//MARK: my solution: passed
//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
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
//
//
//        return ans
//    }
//}

//MARK: - 3. Longest Substring Without Repeating Characters
//let s = "pwwkew"
//let solution = Solution()
//print(solution.lengthOfLongestSubstring(s))

//MARK: my solution (passed)
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        guard s.count > 1 else { return s.count}
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
//
//        maxLen = max(maxLen,counter)
//        return maxLen
//    }
//}

//MARK: - 11. Container With Most Water
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
//MARK: - 15. 3 Sum
//let nums = [-1,0,1,2,-1,-4]
//let solution = Solution()
//print(solution.threeSum(nums))
//MARK: Sample solution
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        guard nums.count >= 3 else {
//            return []
//        }
//
//        let nums = nums.sorted()
//        var answer: [[Int]] = []
//
//        var previousFirstNum: Int?
//        for first in 0...(nums.endIndex-3) {
//            if nums[first] > 0 {
//                break // Everything after that will be even larger because the array is sorted
//            } else if nums[first] == previousFirstNum {
//                continue // Duplicate triplet? Why?
//            } else {
//                previousFirstNum = nums[first]
//            }
//
//            var second = first + 1
//            var third = nums.endIndex - 1
//            while second < third {
//                let sum = nums[first] + nums[second] + nums[third]
//                if sum > 0 {
//                    third -= 1
//                } else if sum < 0 {
//                    second += 1
//                } else {
//                    answer.append([nums[first], nums[second], nums[third]])
//
//                    let previousSecondNum = nums[second]
//                    while second < third && nums[second] == previousSecondNum {
//                        second += 1
//                    }
//
//                    let previousThirdNum = nums[third]
//                    while second < third && nums[third] == previousThirdNum {
//                        third -= 1
//                    }
//                }
//            }
//        }
//
//        return answer
//    }
//}
//MARK: my solution (passed)
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var ans = [[Int]]()
//
//        for (index,num) in nums.enumerated() {
//            let target = num
//            var dict = [Int:Int]()
//            if index+1 != nums.count {
//                for j in index+1..<nums.count {
//                    let diff = target + nums[j]
//                    print(diff)
//                    if let third = dict[nums[j]] {
//                        let result = [target,nums[j],third].sorted()
//                        if !ans.contains(result) {
//                            ans.append(result)
//                        }
//                    } else {
//                        dict[-diff] = nums[j]
//                    }
//                }
//            }
//        }
//        return ans
//    }
//
//}
//

//MARK: - 20. Valid Parentheses
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

//MARK: - 21. Merge Two Sorted Lists
//
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

//MARK: - 22. Generate Parentheses
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
//
//        return ans
//    }
//    func generate(open: Int, close: Int,n: Int, string: String, ans: inout [String]) {
//        if open == close && close == n {
//            ans.append(string)
//        }
//        if open < n {
//            var str = string
//            str.append("(")
//            var o = open
//            o += 1
//            generate(open: o, close: close, n: n, string: str, ans: &ans)
//        }
//        if close < open {
//            var str = string
//            str.append(")")
//            var c = close
//            c += 1
//            generate(open: open, close: c, n: n, string: str, ans: &ans)
//        }
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

//MARK: - 42. Trapping Rain Water
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
//MARK: - 49. Group Anagrams
//let solution = Solution()
//let strs = ["eat","tea","tan","ate","nat","bat"]
//print(solution.groupAnagrams(strs))
//MARK: sample version
//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//
//        var dict = [String: [String]]()
//        // var result = [[String]]()
//
//        for str in strs {
//            let sortStr = String(str.sorted(by: { $0 < $1 }))
//            if dict[sortStr] != nil {
//                var array = dict[sortStr]
//                array?.append(str)
//                dict[sortStr] = array
//            } else {
//                dict[sortStr] = [str]
//            }
//        }
//        // for (_, value) in dict {
//        //     result.append(value)
//        // }
//        return Array(dict.values)
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

//MARK: - 121. Best Time to Buy and Sell Stock
//let prices = [7,1,5,3,6,4]
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

//MARK: - 200. Number of Islands
//let grid: [[Character]] = [
//    ["1","1","1","1","0"],
//    ["1","1","0","1","0"],
//    ["1","1","0","0","0"],
//    ["0","0","0","0","0"]
//  ]
//let s = Solution()
//print(s.numIslands(grid))
//MARK: my solution  (recursive)
//class Solution {
//    func numIslands(_ grid: [[Character]]) -> Int {
//        let row = grid.count - 1
//        let column = grid[0].count - 1
//        var visitied: [[Int]:Int] = [:]
//        var result = 0
//        func bfs(_ r: Int,_ c: Int) {
//            if r <= row && r >= 0 && c <= column && c >= 0 && grid[r][c] == "1" && visitied[[r,c]] == nil{
//                visitied[[r,c]] = 1
//                let directions = [[0,1],[0,-1],[1,0],[-1,0]]
//                for direction in directions {
//                    bfs(r + direction[0], c + direction[1])
//                }
//            }
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
//                let current = q.removeFirst() //deque
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

//MARK: - 347. Top K Frequent Elements
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
//MARK: - 424. Longest Repeating Character Replacement
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
//        var dict:[Character:Int] = [:]
//        var result = 0
//        var left = 0
//        var maxf = 0
//        for (r,char) in s.enumerated() {
//            dict[char, default: 0] += 1
//            maxf = dict.values.max()!
//            while (r - left + 1) - maxf > k , left != s.count {
//                dict[s[s.index(s.startIndex, offsetBy: left)]]! -= 1
//
//                left += 1
//            }
//            result = max(result, r - left + 1)
//        }
//        print(dict)
//        return result
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
//MARK: my solution (dictionary) still slow
//class Solution {
//    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//        guard s2.count >= s1.count else { return false}
//
//        var s1Dictionary: [Character: Int] = [:]
//        for char in s1 {
//            s1Dictionary[char, default: 0] += 1
//        }
//        print(s1Dictionary)
//        for i in 0...s2.count - s1.count {
//            var s2Dictionary: [Character: Int] = [:]
//            let startIndex = s2.index(s2.startIndex, offsetBy: i)
//            let endIndex = s2.index(s2.startIndex, offsetBy: i+s1.count-1)
//            let s2SubString = s2[startIndex...endIndex]
//            for char in s2SubString {
//                s2Dictionary[char, default: 0] += 1
//            }
//            if s1Dictionary == s2Dictionary {
//                return true
//            }
//        }
//
//        return false
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