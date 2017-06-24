//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Justin Gareau on 3/27/17.
//  Copyright © 2017 Justin Gareau. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var resultImage: UIImage?
    var resultMessage: String?
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        // The dice will only appear if firstValue and secondValue have been set
        if let resultImage = self.resultImage {
            self.resultImageView.image = resultImage
        } else {
            self.resultImageView.image = nil;
        }
        
        if let resultMessage = self.resultMessage {
            self.resultLabel.text = resultMessage
        } else {
            self.resultLabel.text = nil
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismiss() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
        // self.dismiss(animated: true, completion: nil)
    }

}

