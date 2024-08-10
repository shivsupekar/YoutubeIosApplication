//
//  ViewController.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 09/08/24.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVedios()
        
    }


}

