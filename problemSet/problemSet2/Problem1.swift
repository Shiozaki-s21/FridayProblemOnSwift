//
// Created by SubaruShiozaki on 2019-03-20.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

func countCyclicPermutation() {
    let numOfQuestion:Int = (Int)(readLine()!)! // num of question

    var results:[Int] = []
    var quesitons:[[String]] = [[]]


    // input part
    for i in 0 ..< numOfQuestion {
        let numOfPath:Int = (Int)(readLine()!)!
        var question:[String] = []
        question.append("0")
        for item in readLine()!.split(separator: " ") {
            question.append(String(item))
        }
        quesitons.append(question)
    }


    for i in 1 ... numOfQuestion{
        results.append(countCyclicPermutationHelper(quesitons[i]))
    }

    print(results)
}

func countCyclicPermutationHelper(_ paths:[String]) -> Int{
    var result:Int = 0
    var usedIndex:[String] = []
    for item in 1 ..< paths.count {
        if !usedIndex.contains(String(item)) && countCyclicPermutationHelper2(String(item), &usedIndex, paths, item) {
            result += 1
        }
    }

    return result
}

func countCyclicPermutationHelper2(_ target:String, _ usedIndedx:inout [String], _ paths:[String], _ index:Int) -> Bool{


    usedIndedx.append(String(index))

    if target == paths[index] {
        return true
    } else {
        return countCyclicPermutationHelper2(target, &usedIndedx, paths, Int(paths[index])!)
    }

    if usedIndedx.contains(paths[index]) {
        return false
    }
}