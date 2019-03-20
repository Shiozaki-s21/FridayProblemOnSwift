//
// Created by 高橋和也 on 2019-03-17.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
var count:Int = 0
func lottoSolver(_ input:[String]) {
    var input = input
    if input.count < 8 || input.first! == "0" {
        return
    }

    // take K and remove it from input array
    let k:Int = Int(input.first!)!
    input.remove(at: 0)
    var lotto:[String] = []

    // call helper
//    for item in 0 ..< k {
//        if(input.count < 6){
//            return
//        }
//        lottoSolveHelper(input, lotto, 0)
//        input.remove(at: item)
//    }
        lottoSolveHelper(input, lotto, 0)
}

func lottoSolveHelper(_ sArray: [String], _ lottoArray: [String], _ start:Int) {

    if lottoArray.count == 6 {
        count += 1
        print(lottoArray)
        return
    } else {
        for item in start ..< sArray.count {

            var sArray = sArray
            var lottoArray = lottoArray

            lottoArray.append(sArray[item])

            lottoSolveHelper(sArray, lottoArray, item + 1)

            lottoArray.removeLast()

        }
    }

    return
}

// 1 -> 6
// 2 -> 6