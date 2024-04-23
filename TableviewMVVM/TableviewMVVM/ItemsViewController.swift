//
//  ItemsViewController.swift
//  TableviewMVVM
//
//  Created by Sai Narayan Goutam Peri on 23/04/24.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private var viewModel: ItemsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here i iinitialize ViewModel with my data
        let items = [
        Item(title: "Bollywood ", subtitle: "Hindi Movie Industry", imageName: "Bollywood"),
        Item(title: "Hollywood", subtitle: "English Movie Industry", imageName: "Hollywood"),
        Item(title: "Tollywood ", subtitle: "Telugu Movie Industry", imageName: "Tollywood"),
        Item(title: "Pollywood", subtitle: "Punjabi Movie Industry", imageName: "Pollywood"),
        Item(title: "Mollywood ", subtitle: "Malayalam Movie Industry", imageName: "Mollywood"),
        Item(title: "Sandalwood", subtitle: "Kannada Movie Industry", imageName: "Sandalwood"),
        Item(title: "Dhallywood ", subtitle: "Bangladeshi Movie Industry", imageName: "Dhallywood"),
        Item(title: "Follywood", subtitle: "SriLankan Movie Industry", imageName: "Follywood"),
        Item(title: "Chinawood", subtitle: "China Movie Industry", imageName: "Chinawood"),
        Item(title: "Aussiewood", subtitle: "Australian Movie Industry", imageName: "Aussiewood"),
        Item(title: "Hallyuwood ", subtitle: "SouthKorean Movie Industry", imageName: "Hallyuwood"),
        Item(title: "Ghollywood ", subtitle: "Ghanaian Movie Industry", imageName: "Ghollywood"),
        ]
        viewModel = ItemsViewModel(items: items)
        
        // Setting up the TableView to be displayed
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        view.addSubview(tableView)
        
        // Add constraints for TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item = viewModel.item(at: indexPath.row)
        cell.configure(with: item)
        // Set the view controller as the delegate of the cell
        cell.delegate = self
        return cell
    }
    
    // MARK: - TableView Delegate
    
    // here i am adjusting the Cell Height , that is the gap between the two consecutive cells
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // we can adjust the value to increase or decrease the spacing between cells
    }
}

// MARK: - ItemTableViewCellDelegate

extension ItemsViewController: ItemTableViewCellDelegate {
    func didTapButton(in cell: ItemTableViewCell) {
        // Get the indexPath of the tapped cell
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        // Get the item corresponding to the tapped cell
        let item = viewModel.item(at: indexPath.row)
        
        // Display an alert
        let alert = UIAlertController(title: "Alert", message: "Thanks for selecting \(item.title)!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
