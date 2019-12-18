//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
     let tableView = UITableView()
    
    //let ~~ = ().randomElement()
    
    private let maxCount = 20
    private let maxRange = 50
    lazy var data = Array(1...maxCount)
//    private let maxNum = data.count + 50
//    private var randomCount = arc4random_uniform(maxNum)  //0~499사이의 난수

    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        //    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(reloadData))
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        
        tableView.rowHeight = 60
        
        //roading부분.
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing..")
        
        tableView.refreshControl = refreshControl
        
    }
    // MARK: table reload
    @objc private func reloadData(){
        //랜덤숫자로 바꿈.
        //        data.count + 50
        data.removeAll()
        
        for _ in 1...maxCount {
            data.append(generateRandomNumber())
        }
        
        tableView.refreshControl?.endRefreshing()
        
        tableView.reloadData()
    }
    
    func generateRandomNumber() -> Int{
        let randomNumber = (0..<maxCount + maxRange).randomElement()!
        
        guard !data.contains(randomNumber) else { return generateRandomNumber() }
        return randomNumber
    }
    
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
