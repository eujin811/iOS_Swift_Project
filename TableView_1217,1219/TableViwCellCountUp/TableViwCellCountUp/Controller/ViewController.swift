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
    let maxNum = 30
    lazy var data = [ 1, 3, 11, 0, 4, 21, 34, 2, 4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI(){
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }

}

extension ViewController: UITableViewDataSource {
    //cell 몇개 띄울꺼니??
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //cell item내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        cell.accessoryType = .checkmark
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {

}
