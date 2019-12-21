//
//  ViewController.swift
//  TableViwCellCountUp
//
//  Created by YoujinMac on 2019/12/19.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    override var description: String = ""
    let tableView = UITableView()
    let plusButton = UIButton()
    let maxNum = 30
    lazy var data = [ 1, 3, 11, 0, 4, 21, 34, 2, 4, 8, 9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI(){
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        view.addSubview(tableView)
        
        plusButton.frame.size = CGSize(width: 60, height: 50)
        tableView.addSubview(plusButton)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }

}

// MARK: -UITableViewDataSource
extension ViewController: UITableViewDataSource {
    //cell 몇개 띄울꺼니??
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //cell item내용 데이터만, uix
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        cell.accessoryType = .checkmark
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let inputData = data[indexPath.row] + 1
        cell.textLabel?.text = "\(inputData)"
        
    }
}
// MARK: -UITableViewDelegate
extension ViewController: UITableViewDelegate {
   
}
