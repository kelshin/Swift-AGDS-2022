//
//  CyclicPermutation.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-04.
//

import Foundation

func cyclicPermutation() {
  
  func dfs(start: Int, check: inout [Bool], nodes: inout [Int]) {
    if check[start] {
      return
    }
    check[start] = true
    dfs(start: nodes[start], check: &check, nodes: &nodes)
  }
  
  var tests = Int(readLine()!)!
  while tests > 0 {
    let n = Int(readLine()!)!
    var nodes = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.insert(0, at: 0)
    var check = [Bool](repeating: false, count: n + 1)
    
    var count = 0
    for v in 1...n {
      if !check[v] {
        dfs(start: v, check: &check, nodes: &nodes)
        count += 1
      }
    }
    print(count)
    tests -= 1
  }
}
