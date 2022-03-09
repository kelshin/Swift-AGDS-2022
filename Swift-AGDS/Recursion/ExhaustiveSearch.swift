//
//  ExhaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-03.
//

import Foundation

/// Print all binary number representation with n digits
/// - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n)
}

func printBinaryExhaustiveHelper(_ n: Int, soFar: String = "", indent: String = "") {
  print("\(indent)printBinaryExhaustiveHelper(n: \(n), soFar: \(soFar))")
  // base case
  if n == 0 {
    print(soFar)
  } else {
    // recursive case
    // for each available choices (0 or 1)
    for i in 0...1 {
      // choose one
      printBinaryExhaustiveHelper(n - 1, soFar: soFar + "\(i)", indent: indent + "  ")
    }
  }
}

/// Print all decimal number representation with n digits
/// - Parameter n: the number digits
func printDecimal(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0...9 {
      printDecimal(n - 1, soFar + "\(i)")
    }
  }
}

/// Write a recursive function permutation that accepts a string as a parameter
/// and outputs all possible rearrangements of the letters in the string.
/// - Parameter word: the string
func permutation(_ word: String) {
  permutationHelper(word)
}

func permutationHelper(_ word: String, soFar: String = "", indent: String = "") {
  print("\(indent)permutation(word: \(word), soFar: \(soFar))")
  if word.count == 0 {
    print(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i]  // choose one character
      permutationHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + c, indent: indent + "  ")
    }
  }
}

func permutationUnique(_ word: String) {
  var set = Set<String>()
  permutationUniqueHelper(word, &set)
  for word in set {
    print(word)
  }
}

func permutationUniqueHelper(_ word: String, soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i]  // choose one character
      permutationUniqueHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + c, &set)
    }
  }
}

func combinations(_ word: String, _ k: Int) {
  var set = Set<Character>()
  var result = Set<String>()
  combinationsHelper(word, k, &set, "", &result)
  print(result)
}

func combinationsHelper(_ word: String, _ k: Int, _ unique: inout Set<Character>, _ soFar: String, _ result: inout Set<String>) {
  if k == 0 {
    result.insert(soFar)
  } else {
    for i in word {
      if !unique.contains(i) {
        unique.insert(i)
        combinationsHelper(word, k - 1, &unique, soFar + String(i), &result)
        unique.remove(i)
      }
    }
  }
}
