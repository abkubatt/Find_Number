//
//  YellowViewController.swift
//  FindNumber
//
//  Created by Abdulmajit Kubatbekov on 12.10.22.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goToBlueController(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: nil)
    }
}
