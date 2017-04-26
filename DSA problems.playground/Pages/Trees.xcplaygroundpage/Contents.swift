//: [Previous](@previous)

import Foundation

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int) {
        self.value = value
    }
    
    func printInOrder(treenode: TreeNode?) -> TreeNode? {
        guard let treenode = treenode else { return nil }
        
        printInOrder(treenode: left)
        printInOrder(treenode: right)
        return treenode
    }
    
    func dfsLeftNodeSumsRecursive(node: TreeNode?, isLeft: Bool) -> Int {
        // base case
        guard let node = node else { return 0 }
        // recursive call
        return (isLeft ? node.value : 0) + dfsLeftNodeSumsRecursive(node: node.left, isLeft: true) + dfsLeftNodeSumsRecursive(node: node.right, isLeft: false)
    }
    
//    func dfsLeftNodeSums(node: TreeNode?) -> Int {
//        var stack: [TreeNode] = [node]
//        var sum = 0
//        while !stack.isEmpty {
//            let newNode = stack.popLast()!
//            if newNode.left != nil {
//                stack.append(newNode.left!)
//                sum += newNode.left
//            }
//            if newNode.right != nil {
//                stack.append(newNode.right)
//            }
//        }
//        return sum
//    }
    
    // Invert a BST: https://leetcode.com/problems/invert-binary-tree/#/description
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let unwrappedRoot = root else {
            return nil
        }
        invertTreeRecursively(root!)
        return root
    }
    func invertTreeRecursively(_ node: TreeNode) {
        swapChildren(node)
        if node.left != nil {
            invertTreeRecursively(node.left!)
        }
        if node.right != nil {
            invertTreeRecursively(node.right!)
        }
    }
    func swapChildren(_ root: TreeNode) {
        let left = root.left
        let right = root.right
        root.left = right
        root.right = left
    }
}

//: [Next](@next)
