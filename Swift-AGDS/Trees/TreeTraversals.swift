//
//  TreeTraversals.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-21.
//

import Foundation

func preOrder(_ node: Int) {
  if node == -1 { return }
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  preOrder(tree[node][0])
  preOrder(tree[node][1])
}

func inOrder(_ node: Int) {
  if node == -1 { return }
  inOrder(tree[node][0])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  inOrder(tree[node][1])
}

func postOrder(_ node: Int) {
  if node == -1 { return }
  postOrder(tree[node][0])
  postOrder(tree[node][1])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

// global variable
var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)

func treeTraversals() {
  let n = Int(readLine()!)!
  for _ in 0..<n {
    // ["A", "B", "C"]
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    let x = Int(Character(nodeInfo[0]).asciiValue! - 65)   // 'A' = 65
    let l = Int(Character(nodeInfo[1]).asciiValue!)
    let r = Int(Character(nodeInfo[2]).asciiValue!)
    // ascii 46 -> . -> -1
    tree[x][0] = l == 46 ? -1 : l - 65
    tree[x][1] = r == 46 ? -1 : r - 65
  }
  
  // preOrder
  preOrder(0)
  print()
  // inOrder
  inOrder(0)
  print()
  
  // postOrder
  postOrder(0)
  print()
}
