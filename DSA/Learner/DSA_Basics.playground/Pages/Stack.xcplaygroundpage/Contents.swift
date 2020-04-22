//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct Stack<T> {
    var arrStack: [T] = []
    
    mutating func push(_ element: T) {
        arrStack.append(element)
    }
    
    mutating func pop() -> T? {
        return arrStack.popLast()
    }
    
    func stackCount() -> Int {
        return arrStack.count
    }
    
    func isEmpty() -> Bool {
        return arrStack.isEmpty
    }
    
    func top() -> T? {
        return arrStack.last
    }
    
    func printStackElements() {
        print("all elemnts:\(arrStack)")
    }
}

var testStack = Stack<Int>()
testStack.push(4)
testStack.push(5)
testStack.push(6)
testStack.printStackElements()
testStack.pop()
testStack.printStackElements()
testStack.pop()
testStack.pop()
testStack.isEmpty()
testStack.pop()

