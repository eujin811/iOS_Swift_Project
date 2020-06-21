//
//  ViewController.swift
//  TestJSON
//
//  Created by YoujinMac on 2020/06/12.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    private let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("")
        
        do{
            let jsonData = try self.decoder.decode(Coordinate.self, from: jsonData)
            
            
        } catch {
            print("error")
        }
    }


}

