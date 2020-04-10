//: [Previous](@previous)

import Foundation

/*
 Given an array nums and a value val, remove all instances of that value in-place and return the new length.
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.

 Example 1:
 Given nums = [3,2,2,3], val = 3,
 Your function should return length = 2, with the first two elements of nums being 2.
 It doesn't matter what you leave beyond the returned length.
 */

//Solution 1

func removeElement(nums: inout [Int], value: Int) -> Int {
    for i in nums where i == value {
        nums.remove(at: 1)
    }
    return nums.count
}

var testArr = [3,2,2,3, 4, 4, 4, 4]
let tt = removeElement(nums: &testArr, value: 5)
print("tt: \(tt)")

//Solution 2 - 2 pointer approach using while

func removeElement1(nums: inout [Int], value: Int) -> Int {
    var i = 0;
    var n = nums.count
    while i < n {
        print("n: \(n)")
        if (nums[i] == value) {
            nums[i] = nums[n - 1]
            // reduce array size by one
            n-=1
        } else {
            i+=1
        }
    }
    print("nums: \(nums)")
    return i;
}

var testArr1 = [2,3,2,3]
let tt1 = removeElement1(nums: &testArr1, value: 2)
print("tt1: \(tt1)")
