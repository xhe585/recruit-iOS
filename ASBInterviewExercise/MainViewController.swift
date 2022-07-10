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
    @IBOutlet weak var balanceLabel: UILabel!
}

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ApiService.shared.getTransactions { transactions in
            self.transactions = transactions.sorted { t1, t2 in
                return t1.transactionDate > t2.transactionDate
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } errorHandler: { error in
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showTransactionDetailSegue") {
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let transaction = transactions[indexPath.row]
            let viewController = segue.destination as! TransactionDetailViewController
            viewController.transaction = transaction
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
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
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let balance = transaction.getBalance()
        cell.balanceLabel.text = formatter.string(from:balance as NSNumber)
        cell.balanceLabel.textColor = balance > 0 ? .systemGreen : .systemRed
        return cell
    }
}

