//
//  Transaction.swift
//  ASBInterviewExercise
//
///Users/jackie/git/recruit-iOS/ASBInterviewExercise/Transaction.swift  Created by Jackie He on 10/07/22.
//

import Foundation

struct Transaction: Codable {
    let id:Int
    let transactionDate:String //TODO should use date instead of string
    let summary:String
    let debit:Decimal
    let credit:Decimal
}
