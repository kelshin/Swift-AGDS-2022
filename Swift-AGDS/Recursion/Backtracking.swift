//
//  Backtracking.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-07.
//

import Foundation

// / Exhaustive search (review)
func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  if n == 0 {
    print(choices)
  } else {
    // for all possible choices
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceHelper(n - 1, choices: &choices)
      // un-choose the last choice
      choices.removeLast()
    }
  }
}

/// Backtracking Problem
/// Output all combinations of die values that add up to the desired sum.
/// - Parameters:
///   - n: the number of dice
///   - sum: a desired sum
func rollDiceSumNaive(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelperNaive(n, sum, &choices)
}

var count = 0
func rollDiceSumHelperNaive(_ n: Int, _ sum: Int, _ choices: inout [Int]) {
  // count += 1
  if n == 0 {
    if sum == 0 {
      print(choices)
    }
  } else {
    // for all possible choices
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceSumHelperNaive(n - 1, sum - i, &choices)
      // un-choose the last choice
      choices.removeLast()
    }
  }
}

func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, sum, 0, &choices)
}

func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, _ soFar: Int, _ choices: inout [Int]) {
  count += 1
  if n == 0 {
    if soFar == desiredSum {
      print(choices)
    }
  } else {
    // for all possible choices
    for i in 1...6 {
      if (soFar + i + 1 * (n - 1) <= desiredSum && (soFar + i + 6 * (n - 1) >= desiredSum)) {
        // choose one
        choices.append(i)
        // explore
        rollDiceSumHelper(n - 1, desiredSum, soFar + i, &choices)
        // un-choose the last choice
        choices.removeLast()
      }
    }
  }
}
 
