//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-04.
//

import Foundation

func diameter() {
  struct Edge {
    let to: Int
    let distance: Int
  }
  
  func bfs(node: Int, visited: inout [Bool], distances: inout [Int], adj: inout [[Edge]]) {
    let q = Queue<Int>()
    visited[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
      let u = q.dequeue()!
      for i in 0..<adj[u].count {
        let edge = adj[u][i]
        if !visited[edge.to] {
          distances[edge.to] = distances[u] + edge.distance
          visited[edge.to] = true
          q.enqueue(item: edge.to)
        }
      }
    }
  }
  
  // read from text file sushi.in.1
  let n = Int(readLine()!)!
  var adj = [[Edge]](repeating: [], count: n + 1)
  var visited = [Bool](repeating: false, count: n + 1)
  var distances = [Int](repeating: 0, count: n + 1)
  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let from = line[0]
    var j = 1
    while j < line.count - 2 {
      let to = line[j]
      let dist = line[j + 1]
      adj[from].append(Edge(to: to, distance: dist))
      if line[j + 2] == -1 {
        break
      }
      j += 2
    }
  }
  
  var start = 1
  bfs(node: start, visited: &visited, distances: &distances, adj: &adj)
  for i in 2...n {
    if distances[i] > distances[start] {
      start = i
    }
  }
  
  var visited2 = [Bool](repeating: false, count: n + 1)
  var distances2 = [Int](repeating: 0, count: n + 1)
  bfs(node: start, visited: &visited2, distances: &distances2, adj: &adj)
  print(distances2.max()!)  // O(n)
}
