//
//  Dijkstras.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-25.
//

import Foundation

func dijkstraArray(_ adj: [[(v: Int, w: Int)]], _ src: Int) -> [Int] {
  let n = adj.count
  var c = [Bool](repeating: false, count: n + 1)
  var d = [Int](repeating: Int.max, count: n + 1)
  
  // starting node
  d[src] = 0
  for _ in 0..<n-1 {
    // look for the current min value in d
    var minVertex = 1
    for v in 1...n {
      if !c[v] && d[v] < d[minVertex] {
        minVertex = v
      }
    }
    
    c[minVertex] = true
    for edge in adj[minVertex] {
      if d[edge.v] > d[minVertex] + edge.w {
        d[edge.v] = d[minVertex] + edge.w
      }
    }
  }
  return d
}

func dijkstraPQ(_ adj: [[(v: Int, w: Int)]], _ src: Int) -> [Int] {
  let n = adj.count
  var d = [Int](repeating: Int.max, count: n + 1)
  d[src] = 0
  
  var pq = IndexPriorityQueue<CompEdge>(<)
  for edge in adj[src] {
    pq.enqueue(CompEdge(u: src, v: edge.v, w: edge.w))
  }
  
  while let edge = pq.dequeue() {
    if edge.w < d[edge.v] {
      d[edge.v] = edge.w
      for e in adj[edge.v] {
        pq.enqueue(CompEdge(u: edge.v, v: e.v, w: e.w + edge.w))
      }
    }
  }
  
  return d
}
