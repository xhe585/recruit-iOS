//
//  TransactionDetailViewController.swift
//  ASBInterviewExercise
//
//  Created by Jackie He on 10/07/22.
//

import Foundation
import UIKit

public class TransactionDetailViewController: UIViewController {
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var gstLabel: UILabel!
    var transaction:Transaction?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(transaction != nil)
        {
            self.summaryLabel.text = transaction!.summary
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            self.transactionDateLabel.text = dateFormatter.string(from: transaction!.transactionDate)
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            let balance = transaction!.getBalance()
            self.balanceLabel.text = formatter.string(from:balance as NSNumber)
            self.balanceLabel.textColor = balance > 0 ? .systemGreen : .systemRed
            let gst:Decimal = balance * 0.15
            self.gstLabel.text = "GST: " + formatter.string(from:gst as NSNumber)!
        }
    }
}
