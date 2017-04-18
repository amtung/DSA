//: [Previous](@previous)

import Foundation

class TreeNode {
    var value: Int?
    var left: TreeNode?
    var right: TreeNode?
    
    func printInOrder(treenode: TreeNode?) -> TreeNode {
        guard let treenode = treenode else { return }
        printInOrder(treenode: left)
        print(treenode.value)
        printInOrder(treenode: right)
        return treenode
    }
}

//: [Next](@next)
