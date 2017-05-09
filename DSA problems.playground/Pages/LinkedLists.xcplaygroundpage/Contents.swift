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

/*Flatten a nested linked list structure.
 Example:
 
 List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8))).flatten()
 
 Result: List(1, 1, 2, 3, 5, 8)*/
extension LinkedlistNode {
    func flatten(list: LinkedlistNode<Any>?) /* -> List */{
        // base case
        guard let current = list else { return }
        if let innerList = current.value as? LinkedlistNode<Any> {
            recursivePrint(list: innerList)
        } else {
            print(current.value)
        }
        recursivePrint(list: current.next)
    }
}

/*
 Flatten a nested linked list structure.
 Example:
 
 List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8))).flatten()
 Result:
 
 List(1, 1, 2, 3, 5, 8)
 Implementation:
 
 extension List {
 func flatten() -> List {
 ...
 }
 }
 
 public class List<T> {
    var value: T!
    var nextItem: List<T>?
    
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init!(var _ values: Array<T>) {
        if values.count == 0 {
            return nil
        }
        self.value = values.removeFirst()
        self.nextItem = List(values)
    }
}

func recursivePrint(_ list: List<Any>?) {
    guard let current = list else { return }
    if let innerList = current.value as? List<Any> {
        recursivePrint(innerList)
    } else {
        print(current.value)
    }
    recursivePrint(current.nextItem)
}*/



//: [Next](@next)
