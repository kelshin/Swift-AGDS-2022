//
//  findJudge997.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-04.
//

import Foundation
  
func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
  var inOut = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
  
  for edge in trust {
    inOut[edge[0]][0] += 1  // 0: out-degree
    inOut[edge[1]][1] += 1  // 1: in-degree
  }
  
  for i in 1...n {
    if inOut[i][0] == 0 && inOut[i][1] == n - 1 {
      return i
    }
  }
  return -1
}

