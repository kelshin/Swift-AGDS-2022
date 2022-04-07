//
//  TopologicalSort.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-07.
//

import Foundation

func topologicalSort() {
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let N = firstLine[0]
  let M = firstLine[1]
  var adj = [[Int]](repeating: [Int](), count: N + 1)
  var indegrees = [Int](repeating: 0, count: N + 1)
  
  for _ in 0..<M { // M edges
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v) // DAG
    indegrees[v] += 1
  }
  
  // Topological Sort - using BFS
  let q = Queue<Int>()
  // checking the initial state
  for v in 1...N {
    if indegrees[v] == 0 {
      q.enqueue(item: v)
    }
  }
  
  // BFS
  while !q.isEmpty() {
    let u = q.dequeue()!
    print(u) // print in topological order
    for v in adj[u] {
      indegrees[v] -= 1 // decrement indegree of all connected vertices from u
      if indegrees[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
}
