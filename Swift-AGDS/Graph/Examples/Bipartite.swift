//
//  Bipartite.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-17.
//

import Foundation

func bipartite() {
  
  // 0: not visited, 1: blue, 2: green
  func dfs(start: Int, color: Int, adjList: inout [[Int]], visited: inout [Int]) {
    visited[start] = color
    for v in adjList[start] {
      if visited[v] == 0 {
        dfs(start: v, color: 3 - color, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  let tests = Int(readLine()!)!
  for _ in 0..<tests {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    // adjacency list
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
      adjList[u].append(v)
      adjList[v].append(u) // undirected graph
    }
    
    // coloring vertices
    var visited = [Int](repeating: 0, count: n + 1)
    for v in 1...n {
      if visited[v] == 0 {
        dfs(start: v, color: 1, adjList: &adjList, visited: &visited)
      }
    }
    
    // verifiy
    for u in 0..<adjList.count {
      for v in 0..<adjList[u].count {
        let next = adjList[u][v]
        if visited[u] == visited[next] {
          print("NO")
          return
        }
      }
    }
    print("YES")
  }
}

