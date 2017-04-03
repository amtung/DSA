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

// https://leetcode.com/problems/keyboard-row/#/description
// Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard

//Ask clarifying questions
//Only letters?  Or symbols/numbers as well?
//One specific row, or any row?
//Can we use the same key twice?

//Inputs + Outputs
//Input: [String]
//Output: [String]

// Ex.  Input: ["Hello", "Alaska", "Dad", "Peace"]
//      Output: ["Alaska", "Dad"]

//Explain solution in words

//Iterate through each word in our array.  Iterate through each characters in each word, and check to see if they are all on the same row.  If so, append the string to a final array.  If not, continue. Return the final array.


//Code and explain a solution

func findWords(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    
    return words.filter {
        let letterSet = Set($0.lowercased().characters)
        return letterSet.isSubset(of: row1) || letterSet.isSubset(of: row2) || letterSet.isSubset(of: row3)
    }
}

func findWordsThree(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    
    return words.filter { Set($0.lowercased().characters).isSubset(of: row1) || Set($0.lowercased().characters).isSubset(of: row2) || Set($0.lowercased().characters).isSubset(of: row3) }
}

func findWordsTwo(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    var finalArr = [String]()
    
    func allCharsIn(row: Set<Character>, with str: String) -> Bool {
        for c in str.lowercased().characters {
            if !row.contains(c) {
                return false
            }
        }
        return true
    }
    
    for word in words {
        let firstLetter = word.lowercased()[word.startIndex]
        var shouldAppend = true
        switch firstLetter {
        case _ where row1.contains(firstLetter):
            shouldAppend = allCharsIn(row: row1, with: word)
        case _ where row2.contains(firstLetter):
            shouldAppend = allCharsIn(row: row2, with: word)
        case _ where row3.contains(firstLetter):
            shouldAppend = allCharsIn(row: row3, with: word)
        default:
            shouldAppend = false
        }
        if shouldAppend{
            finalArr.append(word)
        }
    }
    return finalArr
}

func findWordsFour(_ words: [String]) -> [String] {
    let topRow: [Character] = ["q","w","e","r","t","y","u","i","o","p"]
    let midRow: [Character] = ["a","s","d","f","g","h","j","k","l"]
    let bottomRow: [Character] = ["z","x","c","v","b","n","m"]
    var outputArr: [String] = []
    
    for word in words {
        var topCounter = 0
        var midCounter = 0
        var bottomCounter = 0
        let lowercasedWord = word.lowercased()
        for character in lowercasedWord.characters {
            if topRow.contains(character) {
                topCounter += 1
            } else if midRow.contains(character) {
                midCounter += 1
            } else if bottomRow.contains(character) {
                bottomCounter += 1
            }
        }
        if topCounter == word.characters.count || midCounter == word.characters.count || bottomCounter == word.characters.count {
            outputArr.append(word)
        }
    }
    return outputArr
}

// Given an array of random numbers, Push all the zero’s of a given array to the end of the array. For example, if the given arrays is {1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0}, it should be changed to {1, 9, 8, 4, 2, 7, 6, 0, 0, 0, 0}. The order of all other elements should be same. 
func moveAllZeroesToEndOfArray(arr: [Int]) -> [Int] {
    var filteredArr = arr.filter{$0 != 0}
    for num in arr {
        if num == 0 {
            filteredArr.append(num)
        }
    }
    return filteredArr
}
moveAllZeroesToEndOfArray(arr: [1,9,8,4,0,0,2,7,0,6,0])




//: [Next](@next)
