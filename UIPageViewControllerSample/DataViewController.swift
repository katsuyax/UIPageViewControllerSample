//
//  DataViewController.swift
//  UIPageViewControllerSample
//
//  Copyright © 2015年 CrossBridge. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var labelStr:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
