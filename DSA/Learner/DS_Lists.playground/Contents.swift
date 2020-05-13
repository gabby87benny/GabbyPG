import UIKit

var str = "Hello, playground"

class LinkedList<T> {
    
    class LinkedListNode<T> {
        var value: String
        weak var previous: LinkedListNode<T>?
        var next: LinkedListNode<T>?
        
        init(value: String) {
            self.value = value
        }
    }
    
    typealias Node = LinkedListNode<T>
    
    private(set) var head: Node?
    
    var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
}
