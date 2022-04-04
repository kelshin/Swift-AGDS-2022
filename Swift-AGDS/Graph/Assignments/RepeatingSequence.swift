//
//  RepeatingSequence.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-04.
//

import Foundation

func repeatingSequence() {
  
  func next(A: Int, P: Int) -> Int {
    return String(A)
              .map { power(base: Int(String($0))!, exponent: P) }
              .reduce(0, +)
  }
  
  func length(A: Int, P: Int, seq: Int, check: inout [Int]) -> Int {
    if check[A] != 0 {
      return check[A] - 1
    }
    check[A] = seq
    let nx = next(A: A, P: P)
    return length(A: nx, P: P, seq: seq + 1, check: &check)
  }
  
  var check = [Int](repeating: 0, count: 1_000_000)
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let A = input[0]
  let P = input[1]
  print(length(A: A, P: P, seq: 1, check: &check))
}
