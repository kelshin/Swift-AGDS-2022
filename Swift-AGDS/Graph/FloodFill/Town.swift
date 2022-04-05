//
//  Town.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-04-05.
//

import Foundation

func town() {
  
  struct Square {
    let x: Int
    let y: Int
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  var townMap = [[Int]]()
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
  var answer = [Int](repeating: 0, count: 25 * 25)
  
  func bfs(x: Int, y: Int, id: Int, n: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    groupMap[x][y] = id
    answer[id] += 1
    
    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        // check the bounds
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if townMap[nx][ny] == 1 && groupMap[nx][ny] == 0 {
            q.enqueue(item: Square(x: nx, y: ny))
            groupMap[nx][ny] = id
            answer[id] += 1
          }
        }
      }
    }
  }
  
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    townMap.append(row)
  }
  
  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && groupMap[x][y] == 0 {
        id += 1
        bfs(x: x, y: y, id: id, n: n)
      }
    }
  }
  
  print(id)
  answer = Array(answer[1...id])
  answer.sort()
  for i in answer {
    print(i)
  }
  
}
