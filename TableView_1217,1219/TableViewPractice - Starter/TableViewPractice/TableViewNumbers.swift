//
//  TableViewNumbers.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewNumbers: UIViewController {
  
  /***************************************************
   1부터 50까지의 숫자 출력하기
   ***************************************************/
    let data = Array(1...50)
    
  override var description: String { "Practice 1 - Numbers" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
  }
}

extension TableViewNumbers: UITableViewDataSource {
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 50
        return data.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ID 미등록
//        let cell:UITableViewCell
//        if let resubleCell = tableView.dequeueReusableCell(withIdentifier: "CellID"){
//            cell = resubleCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        // ID 선등록
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}
