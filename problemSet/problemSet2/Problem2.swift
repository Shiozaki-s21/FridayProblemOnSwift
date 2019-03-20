//
// Created by SubaruShiozaki on 2019-03-20.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

func repeatingSequence(_ firstNumber:Int, _ powNum:Int) {
    var arr:[Int] = [firstNumber]
    let result = repeatingSequenceHelper(&arr, powNum)
    print(result)
}

func repeatingSequenceHelper(_ arr:inout [Int], _ powNum:Int) -> Int {

    // take the number from each digit
    var target:Int = arr.last!
    var tmpString = String(target)

    var result:Int = 0

    for digit in tmpString {
        var digit = String(digit)
        result += Int(pow(Double(digit)!, Double(powNum)))
    }

    if let hasSame = arr.firstIndex(of: result) {
        return hasSame 
    } else {
        arr.append(result)
        return repeatingSequenceHelper(&arr, powNum)
    }
}