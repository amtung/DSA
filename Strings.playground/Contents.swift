//: Playground - noun: a place where people can play

import UIKit

/* Clarifying questions
 1. Can I use a higher ordered functions?
 2. Can I use .reverse()?
 3. How do I handle whitespace and punctuation?
 */

/* Identify inputs and outputs
 1. Input: String, output: String
 2. Input: String, output: Void (Print the reversed String)
 3. Input: Void (By extending the struct), output: Void
 */

/* Give an explanation in words
 1. Iterate through each character in the string, from the last character to the first. Append each character in an empty array of characters. Convert this array of characters into a string, then return it.
 2. Iterate through each character in the string, from the last character to the last. Push each character onto a stack of characters. Create a string by popping each character off then adding to the end of the string, then return the string.
 */

// Write code to solve a problem
func reverseStr(str: String) -> String {
    var myStack: [Character] = []
    for c in str.characters {
        myStack.append(c)
    }
    var reversedStr = ""
    while !myStack.isEmpty {
        reversedStr.append(myStack.popLast()!)
    }
    return reversedStr
}
// Debug code by testing with sample inputs
// "sample"
// [s,a,m,p,l,e] -> []
//reversedStr = ""
//reversedStr = "elpmas"
reverseStr(str: "sample")

// Count vowels in the string
func numberOfVowelsIn(str: String) -> Int {

    var vowelCounter: Int = 0
    let vowels: [Character] = ["a","A","e","E","i","I","o","O","u","U"]
    
    for c in str.characters {
        if vowels.contains(c) {
            vowelCounter += 1
        }
    }
    return vowelCounter
}
numberOfVowelsIn(str: "Annie")