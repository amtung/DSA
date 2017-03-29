//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/intersection-of-two-arrays/#/description
// Given two arrays, write a function to compute their intersection.

// Questions: 
// How do we handle negative numbers?
// How should we order the return array?
// Do we need to handle arrays of types other than ints?

func intersection(arr1: [Int], arr2: [Int]) -> [Int] {
    return Array(Set(arr1).intersection(Set(arr2)))
}
intersection(arr1: [1,2,2,1], arr2: [1,2])

// no set solution: iterate through an input array and for each value, check to see if the second array contains that value. If it does and the final array doesn't yet contain that value, append it to the final array.
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var intersectionNums: [Int] = []
    for num in nums1 {
        if nums2.contains(num) {
            intersectionNums.append(num)
        }
    }
    return Array(Set(intersectionNums))
}
intersection(arr1: [17,8,9,9,1], arr2: [8,9,9,4])






//: [Next](@next)
