//
// Created by SubaruShiozaki on 2019-03-25.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//


import Foundation

struct Pair {
    let x: Int
    let y: Int
}

//let dx = [0, 0, 1, -1]
//let dy = [1, -1, 0, 0]
var group = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 10), count: 10)
var townMap = [[Int]]()
var leastCount = 99

func simpleBFS(x: Int, y: Int, groupNum: Int, n: Int) {
    var q = Queue<Pair>()
    q.enqueue(Pair(x: x, y: y))
    group[x][y] = groupNum
    while !q.isEmpty {
        let first = q.dequeue()!
        let x = first.x
        let y = first.y
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if townMap[nx][ny] == 1 && group[nx][ny] == 0 {
                    q.enqueue(Pair(x: nx, y: ny))
                    group[nx][ny] = groupNum
                }
            }
        }
    }
}

var n = 0
func Town() {
    n = Int(readLine()!)!

    for y in 0..<n {
        var line = readLine()!.split(separator: " ")
        townMap.append([Int]())

        for item in line {
            var x:String = String(item)
            townMap[y].append(Int(x)!)
        }
    }

    var groupNum = 0
    for r in 0..<n {
        for c in 0..<n {
            if townMap[r][c] == 1 && group[r][c] == 0 {
                groupNum += 1
                simpleBFS(x: r, y: c, groupNum: groupNum, n: n)
            }
        }
    }

    // finished numbering

    var minCount = 99
    for x in 0..<n {
        for y in 0..<n {
            if group[x][y] != 0 {
                var count = 0
                townHelper(target: group[x][y],x: x, y: y, count: &count)
            }
        }
    }

    print(leastCount)
}

func townHelper(target:Int, x:Int, y:Int, count:inout Int) {
    if count < leastCount {
        for item in 0..<4 {
            let nx = dx[item] + x
            let ny = dy[item] + y

            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if group[nx][ny] == 0 {
                    count += 1
                    townHelper(target: target, x: nx, y: ny, count: &count)
                } else if group[nx][ny] != 0 && group[nx][ny] != target {
                    if leastCount > count {
                        leastCount = count
                    }
                    count = 0
                    return
                }
            }
        }
    }
        // check
//        for item in 0..<4 {
//            let nx = dx[item] + x
//            let ny = dy[item] + y
//            // if 1 was finded around
//            if nx >= 0 && nx < n && ny >= 0 && ny < n {
//                // check each square
//                var count = count + 1
//                if group[nx][ny] != 0 && group[nx][ny] != townNum {
//                    return count
//                } else if group[nx][ny] == 0 {
//                    // call myself
//                    return townHelper(townNum: townNum, x: nx, y: ny, count: &count, minCount: &minCount)
//                }
//            }
//        }

    return
}