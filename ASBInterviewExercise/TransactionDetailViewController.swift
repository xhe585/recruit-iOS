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
    @IBOutlet weak var debitOrCreditLabel: UILabel!
    var transaction:Transaction?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(transaction != nil)
        {
            self.summaryLabel.text = transaction!.summary
            self.transactionDateLabel.text = transaction!.transactionDate
            self.debitOrCreditLabel.text = "\(transaction!.debit - transaction!.credit)"
        }
    }
}
