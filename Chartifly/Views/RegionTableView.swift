//
//  RegionTableView.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/23/21.
//

import UIKit

private let reuseIdentifier = "RegionTableCell"

class RegionTableView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCell()
    }
    
    fileprivate func configureCell() {
        let nib = UINib(nibName: "RegionTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
}

// MARK: - Table view data source

extension RegionTableView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 144
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RegionTableCell
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = indexPath.row
        let layout = UICollectionViewFlowLayout()
        let chartView = ChartCollectionView(collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        chartView.modalPresentationStyle = .fullScreen
        
        navigationController?.present(chartView, animated: true, completion: nil)
    }
}
