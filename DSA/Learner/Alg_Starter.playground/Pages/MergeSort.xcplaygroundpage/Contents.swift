//: [Previous](@previous)

import Foundation

func mergeSort(_ arrUnsorted: [Int]) -> [Int] {
    print("arrUnsorted : \(arrUnsorted) count: \(arrUnsorted.count)")
    guard arrUnsorted.count > 1 else {
        return arrUnsorted
    }
    
    let midIndex = arrUnsorted.count / 2
    print("midIndex: \(midIndex)")
    let arrTillMidIndex = arrUnsorted[0..<midIndex]
    //arrTillMidIndex is array slice (ArraySlice<Int>) and not an array (Array<Int>)
    //Hence convert the array slice to an array like below
    let nArrTillMidIndex = Array(arrTillMidIndex)
    print("nArrTillMidIndex: \(nArrTillMidIndex)")
    let leftArray = mergeSort(nArrTillMidIndex)
    print("leftArray: \(leftArray)")
    
    print("*************** leftArray *****************")
    
    let arrAfterMidIndex = arrUnsorted[midIndex ..< arrUnsorted.count]
    let nArrAfterMidIndex = Array(arrAfterMidIndex)
    print("nArrAfterMidIndex: \(nArrAfterMidIndex)")
    let rightArray = mergeSort(nArrAfterMidIndex)
    print("rightArray: \(rightArray)")
    
    print("*************** rightArray *****************")
    
    print("Input to merge: leftArr: \(leftArray) rightArr: \(rightArray)")
    let mergedArr = merge(leftPile: leftArray, rightPile: rightArray)
    //print("mergedArr: \(mergedArr)")
    
    print("*************** mergedArr *****************")
    return mergedArr
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
  // 1
  var leftIndex = 0
  var rightIndex = 0

  // 2
  var orderedPile = [Int]()
  orderedPile.reserveCapacity(leftPile.count + rightPile.count)

  // 3
  while leftIndex < leftPile.count && rightIndex < rightPile.count {
    if leftPile[leftIndex] < rightPile[rightIndex] {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
    } else if leftPile[leftIndex] > rightPile[rightIndex] {
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    } else {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    }
  }

  // 4
  while leftIndex < leftPile.count {
    orderedPile.append(leftPile[leftIndex])
    leftIndex += 1
  }

  while rightIndex < rightPile.count {
    orderedPile.append(rightPile[rightIndex])
    rightIndex += 1
  }

  return orderedPile
}

mergeSort([4, 1, 7, 2, 5])

