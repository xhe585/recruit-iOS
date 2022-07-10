//
//  ViewController.swift
//  ASBInterviewExercise
//
//  Created by ASB on 29/07/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell
{
    @IBOutlet weak var summaryLabel: UILabel!
    
}

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ApiService.shared.getTransactions { transactions in
            self.transactions = transactions
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } errorHandler: { error in
            print(error)
        }
    }
    
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionTableViewCell", for: indexPath) as! TransactionTableViewCell

        let transaction = transactions[indexPath.row]
        cell.summaryLabel.text = transaction.summary
        return cell
    }
}

