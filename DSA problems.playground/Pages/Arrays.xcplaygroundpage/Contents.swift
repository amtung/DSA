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

func findWordsTwo(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    
    return words.filter { Set($0.lowercased().characters).isSubset(of: row1) || Set($0.lowercased().characters).isSubset(of: row2) || Set($0.lowercased().characters).isSubset(of: row3) }
}

func findWordsThree(_ words: [String]) -> [String] {
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

// https://leetcode.com/problems/move-zeroes/#/description
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

func moveZeroesTwo(nums: [Int]) -> [Int] {
    var zeroArr = [Int]()
    var nonZeroArr = [Int]()
    for value in nums {
        if value == 0 {
            zeroArr.append(value)
        } else {
            nonZeroArr.append(value)
        }
    }
    return nonZeroArr + zeroArr
}
moveZeroesTwo(nums: [0,23,0,3,52,4,6,0,0,2,0,13])

//iterate through the array
//for each value, if it is zero, append it to one array
//if it is nonzero, append it to a different array
//return the nonzero array + the zero array
func removeZerosThree(arr: [Int]) -> [Int] {
    var zeroArr = [Int]()
    var nonZeroArr = [Int]()
    for value in arr {
        if value == 0 {
            zeroArr.append(value)
        } else {
            nonZeroArr.append(value)
        }
    }
    return nonZeroArr + zeroArr
}

func removeZerosInPlace(arr: inout [Int]) {
    var zeroFinderIndex = 0
    var numberFinderIndex = 0
    while zeroFinderIndex < arr.count && numberFinderIndex < arr.count - 1 {
        if arr[zeroFinderIndex] == 0 {
            numberFinderIndex += 1
            if arr[numberFinderIndex] != 0 {
                swap(&arr[zeroFinderIndex], &arr[numberFinderIndex])
            }
        } else {
            zeroFinderIndex += 1
        }
    }
}
var testArr = [1,0,0,0,0,1]
removeZerosInPlace(arr: &testArr)

func removeZerosHigherOrder(arr: [Int]) -> [Int] {
    return arr.filter{$0 != 0} + Array(repeating: 0, count: arr.reduce(0){$1 == 0 ? $0 + 1 : $0})
}

// Given an array of integers, return indices of the two numbers such that they add up to a specific target. You may assume that each input would have exactly one solution, and you may not use the same element twice.
// Given nums = [2, 7, 11, 15], target = 9,
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1]

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (indexi, numi) in nums.enumerated() {
        if dict[target - numi] == nil {
            dict[numi] = indexi
        } else {
            return [dict[target - numi]!, indexi]
        }
    }
    return []
}
twoSum([2,7,11,15], 9)

// Find the element in an array which occurs more than n/2 times where n is the size of the array
func majorityElement<T: Hashable>(_ nums: [T]) -> T? {
    var frequencyDict = [T:Int]()
    for num in nums {
        frequencyDict[num] = (frequencyDict[num] ?? 0) + 1
        if frequencyDict[num]! > nums.count / 2 {
            return num
        }
    }
    return nil
}

//: [Next](@next)
