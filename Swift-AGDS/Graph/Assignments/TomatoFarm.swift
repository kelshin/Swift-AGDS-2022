//
//  TomatoFarm.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-11.
//

import Foundation

func tomatoFarm() {
  let dx = [1, -1, 0, 0]
  let dy = [0, 0, 1, -1]
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let width = firstLine[0]
  let height = firstLine[1]
  
  var days = [[Int]](repeating: [Int](repeating: -1, count: width), count: height)
  var grid = [[Int]]()
  for _ in 0..<height {
    grid.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  let q = Queue<(x: Int, y: Int)>()
  for r in 0..<height {
    for c in 0..<width {
      if grid[r][c] == 1 {
        q.enqueue(item: (x: c, y: r))
        days[r][c] = 0
      }
    }
  }
  
  while !q.isEmpty() {
    let first = q.dequeue()!
    let x = first.x
    let y = first.y
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx >= 0 && nx < width && ny >= 0 && ny < height {
        if grid[ny][nx] == 0 && days[ny][nx] == -1 {
          days[ny][nx] = days[y][x] + 1
          q.enqueue(item: (x: nx, y: ny))
        }
      }
    }
  }
  
  var answer = 0
  for r in 0..<height {
    for c in 0..<width {
      if grid[r][c] == 0 && days[r][c] == -1 {
        answer = -1
        print(answer)
        return
      }
      if answer < days[r][c] {
        answer = days[r][c]
      }
    }
  }
  print(answer)
}
