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

// Capitalize first letter in each word
func capitalizeFirstLetter(_ str: String) -> String {
    
    let words = str.components(separatedBy: " ")
    var capitalizedStr = ""
    
    for word in words {
        capitalizedStr += (word.capitalized + " ")
    }
    
    capitalizedStr = capitalizedStr.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    return capitalizedStr
}
capitalizeFirstLetter("this is a test string")

// Given a string, return the first character that appears and doesn't appear anywhere else
func returnFirstChar(str: String) -> Character? {
    var dict = [Character:Int]()
    var arrOfChar = [Character]()
    guard !str.isEmpty else { return nil }
    for c in str.characters {
        if dict[c] == nil {
            dict[c] = 1
        } else {
            dict[c]! += 1
        }
    }
    for (key,value) in dict {
        if value == 1 {
            arrOfChar.append(key)
        }
    }
    for c in str.characters {
        if arrOfChar.contains(c) {
            return c
        }
    }
    return nil
}
var testString = "aardvark"
print(returnFirstChar(str: testString)!)

// https://leetcode.com/problems/ransom-note/#/description
/*Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false. Each letter in the magazine string can only be used once in your ransom note.
 
Note:You may assume that both strings contain only lowercase letters.
canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true*/
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    guard !ransomNote.isEmpty else { return true }
    var ransomNoteDict = [Character:Int]()
    var magazineDict = [Character:Int]()
    for char in ransomNote.characters {
        ransomNoteDict[char] = (ransomNoteDict[char] ?? 0) + 1
    }
    for char in magazine.characters {
        magazineDict[char] = (magazineDict[char] ?? 0) + 1
    }
    for (key, value) in ransomNoteDict {
        if let magazineValue = magazineDict[key] {
            if value > magazineValue {
                return false
            }
        } else {
            return false
        }
    }
    return true
}
print(canConstruct("aa", "aab"))
print(canConstruct("a", "b"))
print(canConstruct("aa", "ab"))
