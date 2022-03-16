//
//  BFS.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-16.
//

import Foundation

func adjacencyListBFS() {
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  
  // adjacency list
  var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    adjList[u].append((v, w))
    adjList[v].append((u, w)) // undirected graph
  }
  
  // BFS - starting from vertex 1
  var visited = [Bool](repeating: false, count: n + 1)
  let queue = Queue<Int>()
  queue.enqueue(item: 1)  // starting vertex 1
  visited[1] = true
  
  while !queue.isEmpty() {
    let u = queue.dequeue()!
    print(u)
    for (v, _) in adjList[u] {
      if !visited[v] {
        queue.enqueue(item: v)
        visited[v] = true
      }
    }
  }
}
