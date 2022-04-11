//
//  Bridges.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-11.
//

import Foundation

func bridges() {
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  let n = Int(readLine()!)!
  var group = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  var distance = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
  var inputMap = [[Int]]()
  for _ in 0..<n {
    inputMap.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  // Labeling Groups
  var count = 0
  for r in 0..<n {
    for c in 0..<n {
      if inputMap[r][c] == 1 && group[r][c] == 0 {
        count += 1
        group[r][c] = count
        let q = Queue<(Int, Int)>()
        q.enqueue(item: (r, c))
        while !q.isEmpty() {
          let (x, y) = q.dequeue()!
          for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
              if inputMap[nx][ny] == 1 && group[nx][ny] == 0 {
                group[nx][ny] = count
                q.enqueue(item: (nx, ny))
              }
            }
          }
        }
      }
    }
  }
  
  // Marking Distance
  let q = Queue<(Int, Int)>()
  for r in 0..<n {
    for c in 0..<n {
      if inputMap[r][c] == 1 {
        q.enqueue(item: (r, c))
        distance[r][c] = 0
      }
    }
  }
  
  // Land extension
  while !q.isEmpty() {
    let (x, y) = q.dequeue()!
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx >= 0 && nx < n && ny >= 0 && ny < n {
        if distance[nx][ny] == -1 {
          distance[nx][ny] = distance[x][y] + 1
          group[nx][ny] = group[x][y]
          q.enqueue(item: (nx, ny))
        }
      }
    }
  }
  
  // Get the minimum
  var answer = Int.max
  for r in 0..<n {
    for c in 0..<n {
      for k in 0..<4 {
        let x = r + dx[k]
        let y = c + dy[k]
        if x >= 0 && x < n && y >= 0 && y < n {
          if group[r][c] != group[x][y] {
            answer = min(answer, distance[r][c] + distance[x][y])
          }
        }
      }
    }
  }
  
  print(answer)
}
