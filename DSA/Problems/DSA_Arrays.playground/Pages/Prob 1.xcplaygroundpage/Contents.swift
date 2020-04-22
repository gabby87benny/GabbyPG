import UIKit

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

//Solution 1 - One pass best:

func getIndices(arr: [Int], target: Int) -> [Int] {
    var arrIndices: [Int] = []
    for (index, value) in arr.enumerated() {
        let difference = target - value
        if arr.contains(difference) {
            arrIndices.append(index)
        }
    }
    return arrIndices
}

//test
let indices = getIndices(arr: [2, 3, 3, 15], target: 6)
print("Solution 1: \(indices)")

//Solution 2 - Brute force:

func getIndices1(arr: [Int], target: Int) -> [Int] {
    var arrIndices: [Int] = []
    for (iIndex,value) in arr.enumerated() {
        let arrPlus1 = arr[iIndex+1 ..< arr.count]
        for (_, value1) in arrPlus1.enumerated() {
            if value1 == target - value {
                if let indexOfA = arr.firstIndex(of: value1) {
                    arrIndices.append(contentsOf: [iIndex, indexOfA])
                    break
                }
            }
        }
    }
    return arrIndices
}

//test
let indices1 = getIndices1(arr: [2, 3, 2, 4], target: 7)
print("Solution 2: \(indices1)")
