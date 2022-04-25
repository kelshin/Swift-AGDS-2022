//
//  main.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2022-03-02.
//

import Foundation


var adjList = [[(v: Int, w: Int)]](repeating: [(v: Int, w: Int)](), count: 8)
adjList[1].append((v: 2, w: 28))
adjList[2].append((v: 1, w: 28))
adjList[1].append((v: 6, w: 10))
adjList[6].append((v: 1, w: 10))
adjList[2].append((v: 7, w: 14))
adjList[7].append((v: 2, w: 14))
adjList[2].append((v: 3, w: 16))
adjList[3].append((v: 2, w: 16))
adjList[3].append((v: 4, w: 12))
adjList[4].append((v: 3, w: 12))
adjList[4].append((v: 7, w: 18))
adjList[7].append((v: 4, w: 18))
adjList[4].append((v: 5, w: 22))
adjList[5].append((v: 4, w: 22))
adjList[5].append((v: 7, w: 24))
adjList[7].append((v: 5, w: 24))
adjList[5].append((v: 6, w: 25))
adjList[6].append((v: 5, w: 25))

//let (cost, mstEdges) = MST.kruskalMST(adjList)
//print(cost)
//print(mstEdges)

let (cost, mstEdges) = MST.primMST(adjList)
print(cost)
print(mstEdges)
