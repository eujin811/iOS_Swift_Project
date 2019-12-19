//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
  // Data :  0 부터  100 사이에 임의의 숫자
     Data: x부터 y까지의 숫자.
   섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
   e.g.
   섹션 0 - 0부터 9까지의 숫자
   섹션 1 - 10부터 19까지의 숫자
   ***************************************************/
  
  override var description: String { "Practice 2 - Section" }
  
//  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
//     let data = Array(1...100)
    let startNum = 5
    let finishNum = 100
    lazy var data = Array(startNum...finishNum)

//    var dataArray = [Int]()
    
    //딕셔너리는 정렬이 안되있으니까 배열에 넣고 소트해서 정렬.
    lazy var sectionTitle: [Int] = dataDic.keys.sorted()
    var dataDic = [Int:[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataCell과 Section 정리한 함수
        dataCellSection()
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        //    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: IdentifyGroup.cellIdentify)
        view.addSubview(tableView)
        
    }
    
    
    // MARK: -dataCell과 섹션의 숫자들 관련 func
    private func dataCellSection(){
        let inputDataCell = data.count
        //시작 숫자붜 데이터 크기만큼 for문
        for i in 0...inputDataCell-1{

            let verify = data[i] / 10

//            dataDic[verify]?.append(data[i])
            if var value = dataDic[verify] {
                value.append(data[i])
                dataDic[verify] = value
            } else {
                dataDic[verify] = [data[i]]
            }
            
        }
        /*
         for i in data {
          if let _ = dataDic[i / 10] {
            dataDic[i/10].append(i)
          } else {
            dataDic[i/10] = [i]
            }
         }
         */
        print("dataDic",dataDic)
    }
    
  

}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    
    
    //섹션에 몇개 나타낼지.
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections:섹션 몇개 나타낼지")
        print("dataDic",dataDic.count)
        return dataDic.count
    }
    //섹션 헤더추가.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("titleForHeaderInSection: 섹션헤더 추가.")
        print("sectionTitle",sectionTitle[section])
        return "\(sectionTitle[section])"
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //몇개의 행.
    // dataDic의 key값의 value 배열 크기만큼의 행을 띄워줌.
    print("numberOfRowInSection:행 몇개띄워줄꺼?")
    let title = dataDic.keys.sorted()
    let key = title[section]
    return dataDic[key]!.count
//    return dataDic[sectionTitle[section]]!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("cellForRowAt: 셀내부요소 채우는거!")
    let cell = tableView.dequeueReusableCell(withIdentifier: IdentifyGroup.cellIdentify, for: indexPath)
//    cell.textLabel?.text = "\(data[indexPath.row])"
    let localData = dataDic[sectionTitle[indexPath.section]]!  //1,2,3,4
    
    cell.textLabel?.text = "\(localData[indexPath.row])"
    
    return cell
  }
}

