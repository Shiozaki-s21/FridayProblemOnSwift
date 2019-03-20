//
// Created by 高橋和也 on 2019-03-17.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

// func
// Exhausted

func calNumberOfTap(_ ch:String, _ numberOfBunded:String, _ bandedNButtons:[String]) -> Int {

    let plusNumber:String = calNumberOfTapPlus(ch, bandedNButtons)
    let minusNumber:String = calNumberOfTapMinus(ch, bandedNButtons)

    let answer:Int
    if Int(plusNumber)! - Int(ch)! < Int(ch)! - Int(minusNumber)! {
        answer = Int(plusNumber)! - Int(ch)!
        return plusNumber.count + answer
    } else {
        answer = Int(ch)! - Int(minusNumber)!
        return minusNumber.count + answer
    }

    return 0
}

func calNumberOfTapPlus(_ ch:String, _ bandedButtons:[String]) -> String {
    if isBanded(ch, bandedButtons) {
        // string to Int
//        var tmp:Int = Int(ch)!
        var tmp = Int(ch)!
        // int + 1
        tmp += 1
        // int to String
        let newCh = String(tmp)
        // call myself
        return calNumberOfTapPlus(newCh, bandedButtons)
    }
    return ch
}

func calNumberOfTapMinus(_ ch:String, _ bandedButtons:[String]) -> String {
    if isBanded(ch, bandedButtons) {
        // string to Int
        var tmp:Int = Int(ch)!
        // int + 1
        tmp -= 1
        // int to String
        let newCh = String(tmp)
        // call myself
        return calNumberOfTapMinus(newCh, bandedButtons)
    }
    return ch
}

func isBanded(_ ch:String, _ bandedNumbers:[String]) -> Bool {
    for bandedNumber in bandedNumbers {
        if ch.contains(bandedNumber) {
            return true
        }
    }
    return false
}


// How to thinking
// --------------------|---------------------------
// --------------------t---------------------------
// if t doesn't have banded numbers, return t
// otherwise, t has it, call myself with t + 1
//                 ↓ ↓ ↓
// ----------------|----|----|-----------------------
// ----------------t-1--t----t+1---------------------
// if t + 1 or t - 1 doesn't have banded numbers, return t + 1
// if they have it, call myself with t + 2......
//
// finally, it method can number which is approximation,
// return approximation.count + i
// in this case, i is number which was added to t