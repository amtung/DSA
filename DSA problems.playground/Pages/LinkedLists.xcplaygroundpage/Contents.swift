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

class myLinkedList {
    var key: Int
    var next: myLinkedList?
    init(key: Int) {
        self.key = key
    }
}

func searchLinkedList(head: myLinkedList, target: Int) -> Bool {
    var currentNode = head
    while currentNode != nil {
        if currentNode.key == target {
            print(currentNode.key)
            
            print("Current node: \(currentNode.key)")
            print("Found target: \(target)")
            return true
        } else {
            currentNode = currentNode.next!
        }
    }
    return false
}

func printAllNodes(list: myLinkedList?) {
    var curretNode = list
    while curretNode != nil {
        print(curretNode?.key ?? "No number", terminator: "->")
        curretNode = curretNode?.next
    }
    print("nil")
}
var thisList = myLinkedList(key: 5)
thisList.next = myLinkedList(key: 14)
thisList.next?.next = myLinkedList(key: 17)
thisList.next?.next?.next = myLinkedList(key: 23)
thisList.next?.next?.next?.next = myLinkedList(key: 25)
printAllNodes(list: thisList)
print(searchLinkedList(head: thisList, target: 25))



//: [Next](@next)
