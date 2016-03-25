//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Hector Rios on 23/03/15.
//  Copyright (c) 2015 HectorRios. All rights reserved.
//

import Foundation

class SlotBrain {
    
    //Re-orders array of slots from being grouped by columns to being grouped by Rows
    class func unpackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]] {
        
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; ++index {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                } else if index == 1 {
                    slotRow2.append(slot)
                } else if index == 2 {
                    slotRow3.append(slot)
                } else {
                    println("Error");
                }
            }
        }
        
        var slotsInRow: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotsInRow
    }
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                println("Flush");
                winnings += 1
                flushWinCount += 1
                
            }
            
            if (checkThreeInARow(slotRow) == true) {
                println("Three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            if checkThreeOfAKInd(slotRow) == true {
                println("Three of a Kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
        }
        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic Straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3 {
            println("Three's all around")
            winnings += 50
        }
        
        return winnings
        
    }
    
    class func checkFlush(slotRow:[Slot]) -> Bool {
        let slotOne = slotRow[0];
        let slotTwo = slotRow[1];
        let slotThree = slotRow[2];
        
        if slotOne.isRed == true && slotTwo.isRed == true && slotThree.isRed == true {
            return true
        } else if slotOne.isRed == false && slotTwo.isRed == false && slotThree.isRed == false {
            return true
        } else {
            return false;
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0];
        let slot2 = slotRow[1];
        let slot3 = slotRow[2];
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        } else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        } else {
            return false
        }
    }
    
    class func checkThreeOfAKInd (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0];
        let slot2 = slotRow[1];
        let slot3 = slotRow[2];
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        } else {
            return false
        }
    }
    
}
