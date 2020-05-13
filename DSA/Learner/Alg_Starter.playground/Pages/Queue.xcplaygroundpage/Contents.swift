//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct Queue<T> {
    var arrQueue: [T] = []
    
    mutating func enqueue(_ element: T) {
        arrQueue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        else {
            return arrQueue.removeFirst()
        }
    }
    
    func queueCount() -> Int {
        return arrQueue.count
    }
    
    func isEmpty() -> Bool {
        return arrQueue.isEmpty
    }
    
    func front() -> T? {
        guard let frontElement = arrQueue.first else {
            return nil
        }
        return frontElement
    }
    
    func printQueueElements() {
        print("all elemnts:\(arrQueue)")
    }
}

var testQueue = Queue<Int>()
testQueue.enqueue(3)
testQueue.enqueue(5)
testQueue.enqueue(6)
testQueue.printQueueElements()
testQueue.dequeue()
testQueue.printQueueElements()
testQueue.isEmpty()
testQueue.front()
testQueue.dequeue()
testQueue.dequeue()
testQueue.isEmpty()
testQueue.dequeue()
