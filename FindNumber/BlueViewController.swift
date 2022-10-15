//
//  BlueViewController.swift
//  FindNumber
//
//  Created by Abdulmajit Kubatbekov on 14.10.22.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToGreenController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "greenVC")
        vc.title = "Зеленый"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
