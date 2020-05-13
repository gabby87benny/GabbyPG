//: [Previous](@previous)

import Foundation

//1 - Linear Search

func linearSearch<T: Equatable>(_ arrElements: [T], _ searchItem: T) -> Int? {
    for i in 0..<arrElements.count {
        if arrElements[i] == searchItem {
            return i
        }
    }
    return nil
}

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]
linearSearch(numbers, 23)

//2 - Binary Search - Recursive

func binarySearch<T: Comparable>(_ arrElements: [T], _ searchItem: T, _ range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    }
    else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

        if arrElements[midIndex] > searchItem {
            return binarySearch(arrElements, searchItem, range.lowerBound ..< midIndex)
        }
        else if arrElements[midIndex] < searchItem {
            return binarySearch(arrElements, searchItem, midIndex+1 ..< range.upperBound)
        }
        else {
            return midIndex
        }
    }
}

let numbers1 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers1, 29, 0 ..< numbers1.count)

//3 - Binary Search - Iterative

func binarySearch1<T: Comparable>(_ arrElements: [T], _ searchItem: T) -> Int? {
    var lowerBound = 0
    var upperBound = arrElements.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if arrElements[midIndex] == searchItem {
            return midIndex
        }
        else if arrElements[midIndex] > searchItem {
            upperBound = midIndex
        }
        else {
            lowerBound = midIndex + 1
        }
    }
    return nil
}

let numbers2 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch1(numbers2, 29)
