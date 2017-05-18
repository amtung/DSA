//: [Previous](@previous)

import Foundation

class LinkedlistNode<T> {
    
    var value: T
    var next: LinkedlistNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class Linkedlist<T> {
    var head: LinkedlistNode<T>?
    
    init(head: LinkedlistNode<T>) {
        self.head = head
    }
    func findNthElement(at index: Int) -> T? {
        var nodeIndex = 0
        if nodeIndex == index {
            return head?.value
        }
        var nodeHead = head
        while let next = nodeHead?.next {
            nodeIndex += 1
            if nodeIndex == index {
                return next.value
            }
            nodeHead = next
        }
        return nil
    }
}





//: [Next](@next)
