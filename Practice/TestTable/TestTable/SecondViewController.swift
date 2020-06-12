//
//  SecondViewController.swift
//  TestTable
//
//  Created by YoujinMac on 2020/06/11.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    private let headerView = HeaderView()
    
    private let day = 1
    private let date = "2020.01.03"
    
    private let cellCount = 5
    private let titleImageString = "DayPayRecord"
    private let categoryImageString = "cafe"
    private let payTypeImageString = "card&cash"
    private let cellTitle:[String] = ["팁싸마이", "길거리", "야시장", "야시장", "진진레스토랑"]//"팁싸마이"
    private let cellComment:[String] = ["오렌지 주스 존맛탱구리~~", "탕후루", "원피스", "커피", "면요리, 후식, 커피"]//"오렌지 주스 존맛탱구리~~"
    private let cellAmount:[Int] = [21, 15, 80, 80, 65]//21
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(SecondCellTableViewCell.self, forCellReuseIdentifier: SecondCellTableViewCell.identifier)
        
        
        
        
        headerView.configure(day: day, date: date)
        
        view.addSubview(tableView)
        view.addSubview(headerView)
        
    }
    
    private func setConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin: CGFloat = 24
        let padding: CGFloat = 16
        
        let headerHeight: CGFloat = ((view.frame.width) / 2 - (margin * 3))
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: guide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            
        ])
        
    }
    
    
}


extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondCellTableViewCell.identifier, for: indexPath) as? SecondCellTableViewCell
        
        cell?.configure(titleImage: UIImage(named: titleImageString)!, categoryImage: UIImage(named: categoryImageString)!, title: cellTitle[indexPath.row], comment: cellComment[indexPath.row], payTypeImage: UIImage(named: payTypeImageString)!, amount: cellAmount[indexPath.row], exchangeType: "USD")
        
        return cell ?? UITableViewCell()
        
    }
    
    
}

//extension SecondViewController: UITableViewDelegate {
//
//}
