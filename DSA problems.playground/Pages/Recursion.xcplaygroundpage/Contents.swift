//: [Previous](@previous)

import Foundation
// https://github.com/amtung/web-technical-interviewing

// Write a function recursiveSum that receives a positive number n and returns the sum of all numbers from 0...n.
func addSum(num: Int) -> Int {
    if num == 0 {
        return 0
    }
    return num + addSum(num: num - 1)
}
print(addSum(num: 7))

// Write a function recursiveMultiply that receives a positive number n and returns the sum of all numbers from 0...n.
func findMultiple(a: Int, b: Int) -> Int {
    guard b > 0 else { return 0 }
    return a + findMultiple(a: a, b: b - 1)
}
print(findMultiple(a: 3, b: 3))

// Write a function factorial that receives a number n and recursively calculates and returns n!.
func findFactorial(num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num * findFactorial(num: num  - 1)
}
print(findFactorial(num: 3))

// Write a recursive function gcf that receives two numbers and returns the greatest common factor of those two numbers.
func findGCF(a: Int, b: Int) -> Int {
    if a > b {
        return b
    }
    findGCF(a: a, b: a % b)
    return 0
}

// Write a function subsets that receives an array and returns all the possible subsets that can be made from the elements in the array.
func findSubsets(arr: [Int], emptyArr: [[Int]]) -> [[Int]] {
    guard arr.count != 0 else { return emptyArr }
    var finalArr = emptyArr
    
    var myArr = arr
    var firstNum = myArr.removeFirst()
    
    let addedArr = finalArr.map{$0 + [firstNum]}
    print(addedArr)

    return findSubsets(arr: myArr, emptyArr: finalArr + addedArr)
}
print(findSubsets(arr: [1,2,3], emptyArr: [[]]))

// recursive fib sequence
func recursiveFib(_ n: Int) -> Int {
    guard n >= 0 else { return 0 }
    guard n != 1 else { return 1 }
    return recursiveFib(n - 1) + recursiveFib(n - 2)
}
print(recursiveFib(3))


//: [Next](@next)
