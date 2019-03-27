//
// Created by SubaruShiozaki on 2019-03-22.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

// variable for checking
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func countTilHarvest(){

    // input part
    var firstLine = readLine()!.split(separator: " ")
    var col = Int(firstLine[0])!
    var line = Int(firstLine[1])!

    var tomatoField = [[Int]]()

    // input part
    for y in 0..<line {
        var line = readLine()!.split(separator: " ")
        tomatoField.append([Int]())

        for item in line {
            var x:String = String(item)
            tomatoField[y].append(Int(x)!)
        }
    }

    // process part
    var count = 0
    while (true) {
        var flag:Bool = true
        var changeMap = tomatoField
        for targetLine in 0..<line {
            for targetCol in 0..<col {
                if tomatoField[targetLine][targetCol] == 0 {
                    // check up down right left
                    for item in 0..<4 {
                        let nLine = dx[item] + targetLine
                        let nCol = dy[item] + targetCol
                        // if 1 was finded around
                        if nLine >= 0 && nLine < line && nCol >= 0 && nCol < col {
                            if tomatoField[nLine][nCol] == 1 {
                                changeMap[targetLine][targetCol] = 1
                                //break
                                flag = false
                            }
                        }
                        for item in tomatoField {
                            print(item)
                        }
                    }
                }
            }
        }
        tomatoField = changeMap

        if flag {
            for x in 0..<line {
                for y in 0..<col {
                    if tomatoField[x][y] == 0 {
                        count = -1
                    }
                }
            }
            print(count)
            return
        }

        count += 1
    }


    // output part

    print(count)

}