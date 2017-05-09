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

// https://leetcode.com/problems/relative-ranks/#/description
/* Given scores of N athletes, find their relative ranks and the people with the top three highest scores, who will be awarded medals: "Gold Medal", "Silver Medal" and "Bronze Medal".
 Input: [5, 4, 3, 2, 1]
 Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]
 Explanation: The first three athletes got the top three highest scores, so they got "Gold Medal", "Silver Medal" and "Bronze Medal".
 For the left two athletes, you just need to output their relative ranks according to their scores.
 N is a positive integer and won't exceed 10,000.
 All the scores of athletes are guaranteed to be unique.*/
func findRelativeRanks(_ nums: [Int]) -> [String] {
    var rankingDict = [Int: String]()
    let sorted = nums.sorted(by: >)
    for i in 0..<sorted.count {
        switch i {
        case 0:
            rankingDict[sorted[i]] = "Gold Medal"
        case 1:
            rankingDict[sorted[i]] = "Silver Medal"
        case 2:
            rankingDict[sorted[i]] = "Bronze Medal"
        default:
            rankingDict[sorted[i]] = "\(i+1)"
        }
    }
    var finalArr = [String]()
    for num in nums {
        finalArr.append(rankingDict[num]!)
    }
    return finalArr
}

/*Given an array of Ints, write a function that returns an array containing only its . For full credit your solution should be O(n). You do not need to preserve the order.
 input: [1,2,3,4,5,1,2,3]
 output: [4,5] (or [5,4])*/
func uniqueValues(in arr: [Int]) -> [Int] {
    var returnArr = [Int]()
    var dict = [Int:Int]()
    
    for num in arr {
        if dict[num] == nil {
            dict[num] = 1
        } else {
            dict[num]! += 1
        }
    }
    for (key,frequency) in dict {
        if frequency == 1 {
            returnArr.append(key)
        }
    }
    return returnArr
}
print(uniqueValues(in: [1,2,3,4,5,1,2,3]))

/* Given 2 arrays, find the duplicates in the array and return it only once.
 input: [5,2,2,3,0], [6,2,0,5]
 output: [5,2,0]
 */
func findDuplicates(arr1: [Int], arr2: [Int]) -> [Int] {
    var returnArr = [Int]()
    var dict1 = [Int:Int]()
    var dict2 = [Int:Int]()
    for num in arr1 {
        dict1[num] = (dict1[num] ?? 0) + 1
    }
    for num in arr2 {
        dict2[num] = (dict2[num] ?? 0) + 1
    }
    for (key, _) in dict1 {
        if dict2[key] != nil {
            returnArr.append(key)
        }
    }
    return returnArr
}
findDuplicates(arr1: [5,2,2,3,0], arr2: [6,2,0,5])

// https://leetcode.com/submissions/detail/99901207/
/* Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false. Each letter in the magazine string can only be used once in your ransom note.
 Note:
 You may assume that both strings contain only lowercase letters.
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

//https://leetcode.com/problems/intersection-of-two-arrays/#/description
/*Given two arrays, write a function to compute their intersection.
 Giver num1 = [1,2,2,1], num2: = [2,2], return [2]
 Note. Each element in the result must be unique, e result can be in any order */
func findIntersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

/* Write a function that checks if a string contains correctly nested/balanced parentheses. The input will only contain the following characters: '(', ')', '[', and/or ']'.
 Input: "[(])" Output: False
 Input: "[(())]" Output: True */
func balancedParens(_ string: String) -> Bool {
    var array = [Character]()
    for i in string.characters {
        if i == "[" || i == "(" {
            array.append(i)
        }
        if i == "]" {
            let last = array.popLast()
            if last != "[" {
                return false
            }
        }
        if i == ")" {
            let last = array.popLast()
            if last != "(" {
                return false
            }
        }
    }
    if !array.isEmpty {
        return false
    }
    return true
}
balancedParens(")(")
balancedParens("[(])")
balancedParens("[]([()])")
balancedParens("(]")

// Given an array of integers, find the largest product of 3 integers
func largestProduct(_ arr: [Int]) -> Int {
    
    guard arr.count > 0 else { return 0 }
    var largest = Int.min
    var secondLargest = Int.min
    var thirdLargest = Int.min
    var temp = 0
    var oldSecondLargest = 0
    var product = 0
    
    for num in arr {
        if num > largest {
            temp = largest
            largest = num
            oldSecondLargest = secondLargest
            secondLargest = temp
            thirdLargest = oldSecondLargest
        }
        else if num > secondLargest {
            temp = secondLargest
            secondLargest = num
            oldSecondLargest = secondLargest
            thirdLargest = temp
        }
        else if num > thirdLargest {
            thirdLargest = num
        }
    }
    product = largest * secondLargest * thirdLargest
    return product
}
largestProduct([1,0,8,4,2,9,1,3])
largestProduct([1,3,2,5,4,1,2])

/* Write a function to calculate the number of characters used to print the numbers “0” to “1000" (inclusive) when spelled out, with whitespace, hyphens and “and” omitted.
 Consider, for example, one through three, would be “onetwothree”, which uses “11" characters; “fortyone” uses “8" characters; and “onehundredone” uses “13" characters. Therefore:
 “countCharacters(from: 1, to: 3)” should return “11"
 “countCharacters(from: 41, to: 41)” should return “8"
 “countCharacters(from: 101, to: 101)” should return “13"
 “countCharacters(from: 525, to: 525)” should return “21" */
var onesPlaceDict = [Int: Int]()

let nums = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

for (index, num) in nums.enumerated() {
    onesPlaceDict[index] = num.characters.count
}

var tensPlaceDict = [Int: Int]()

let numsTens = ["","","twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
for (index, num) in numsTens.enumerated() {
    tensPlaceDict[index] = num.characters.count
}

func countCharsInInt(_ n: Int) -> Int {
    var n = n
    
    if n == 1000 {
        return "onethousand".characters.count
    }
    if n == 0 {
        return "zero".characters.count
    }
    
    var sum = 0
    
    if n > 99 {
        sum += onesPlaceDict[n/100]! + "hundred".characters.count
        n = n % 100
    }
    
    if n < 20 {
        sum += onesPlaceDict[n]!
        return sum
    }
    
    sum += tensPlaceDict[n/10]!
    
    n = n % 10
    sum += onesPlaceDict[n]!
    
    return sum
}

func countChars(start: Int, end: Int) -> Int {
    var sum = 0
    for i in start...end {
        sum += countCharsInInt(i)
    }
    return sum
}
countChars(start: 0, end: 1000)




//: [Next](@next)
