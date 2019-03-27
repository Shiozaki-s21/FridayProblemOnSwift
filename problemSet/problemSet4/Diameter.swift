//
// Created by SubaruShiozaki on 2019-03-27.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

func culDiameter() {
    // input
    let nodeNum = Int(readLine()!)!
    var nodeGrid = [[Int]]()

    nodeGrid.append([Int]())

    for item in 1...nodeNum {

        var input = readLine()!.split(separator: " ")
        nodeGrid.append([Int]())

        for i in 1..<input.count {
            let num = Int(input[i])!
            if num != -1 {
                nodeGrid[item].append(num)
            }
        }
    }

    // process
    var checkedList:[Int] = [1]
    var count = 0
    culDiameterHelper(checkedList: &checkedList, count: count, inputList: nodeGrid, node:1)

    print(nodeGrid)
}

// checkedList, count, inputList, originList
func culDiameterHelper(checkedList: inout [Int], count: Int, inputList:[[Int]], node:Int) {

    var nodes = [Int]()
    var flag:Bool = false
    var count = count

    for item in stride(from: 0, through: inputList[node].count - 1, by: 2) {
        let target = inputList[node]
        if !checkedList.contains(target[item]) {
            flag = true
            checkedList.append(target[item])
            count += target[item + 1]
            culDiameterHelper(checkedList: &checkedList, count: count, inputList: inputList, node: target[item])
        }
    }

    if flag {
        print(count)
        return
    }

    return
}