//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


//1

func insertionSort1(_ arrUnsorted: [Int]) -> [Int] {
    var refArr = arrUnsorted
    for i in 1..<refArr.count {//focusses on each element
        var j = i
        while j > 0 && refArr[j] < refArr[j-1] {// focesses in number of passes
            refArr.swapAt(j-1, j)
            j-=1
        }
    }
    return refArr
}

let result1 = insertionSort1([1, 4, 3, 8, 5, 2])

//2

func insertionSort2(_ arrUnsorted: [Int]) -> [Int] {
    var refArr = arrUnsorted
    for i in 1..<refArr.count {
        var j = i
        let temp = refArr[j]
        while j > 0 && temp < refArr[j-1] {
            refArr[j] = refArr[j-1]
            j-=1
        }
        refArr[j] = temp
    }
    return refArr
}

let result2 = insertionSort2([1, 4, 3, 8, 5, 2])

//3

func insertionSort3<T>(_ arrUnsorted: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var refArr = arrUnsorted
    for i in 1..<refArr.count {
        var j = i
        let temp = refArr[j]
        
        while j > 0 && isOrderedBefore(temp, refArr[j-1]) {
            refArr[j] = refArr[j-1]
            j-=1
        }
        refArr[j] = temp
    }
    return refArr
}

//let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
let strings = ["b", "a", "d", "c", "e"]
insertionSort3(strings, <)
