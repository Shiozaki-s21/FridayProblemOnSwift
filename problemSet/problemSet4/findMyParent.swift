//
// Created by SubaruShiozaki on 2019-03-26.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

func findMyParent(){
    // input
    let nodeNum = Int(readLine()!)!
    var nodeGrid = [[Int]]()

    for item in 0..<nodeNum - 1 {

        var input = readLine()!.split(separator: " ")
        nodeGrid.append([Int]())

        for i in input {
            nodeGrid[item].append(Int(i)!)
        }
    }

    for target in 2...nodeNum {
        for item in 0..<nodeNum - 1 {
            if nodeGrid[item].last! == target {
                print(nodeGrid[item].first!)
            }
        }
    }
}
