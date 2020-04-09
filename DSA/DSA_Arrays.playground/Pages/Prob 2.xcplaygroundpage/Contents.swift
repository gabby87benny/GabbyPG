//: [Previous](@previous)

import Foundation

/*
 Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 Given nums = [1,1,2],
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
 It doesn't matter what you leave beyond the returned length.
 */


//Solution 1:

func getRemovedDuplicateCount(inputArr: [Int]) -> Int {
    var newArr: [Int] = []
    for i in inputArr {
        if !newArr.contains(i) {
            newArr.append(i)
        }
    }
    return newArr.count
}

let nonDuplicateCount = getRemovedDuplicateCount(inputArr: [0,0,1,1,1,2,2,3,3,4])
print("count : \(nonDuplicateCount)")

//Solution 2 : 2 pointer approach with for loop

func getRemovedDuplicateCount1(inputArr: [Int]) -> Int {
    var newArr: [Int] = inputArr
    if newArr.count == 0 {
        return 0
    }
    var iIndex = 1
    for jIndex in 1..<newArr.count {
        if (newArr[jIndex-1] != newArr[jIndex]) {
            newArr[iIndex] = newArr[jIndex]
            iIndex += 1
        }
    }
    return iIndex
}


let nonDuplicateCount1 = getRemovedDuplicateCount1(inputArr: [0,0,0,1,2,2,3,3])
print("count 1: \(nonDuplicateCount1)")

//Solution 3 : 2 pointer approach with while loop

func getRemovedDuplicateCount2(_ numm: inout [Int]) -> Int {
    var nums = numm
    if nums.count == 0 {
        return 0
    }
    
    var index1 = 0
    var index2 = 1
    
    while index2 < nums.count {
        if nums[index1] == nums[index2] {
            nums.remove(at: index2)
        }
        else {
            index1 += 1
            index2 += 1
        }
    }
    
    return nums.count
}

var testArr = [0,0,0,1,2,2,3,3,4,5,6]
let nonDuplicateCount2 = getRemovedDuplicateCount2(&testArr)
print("count 2: \(nonDuplicateCount2)")
