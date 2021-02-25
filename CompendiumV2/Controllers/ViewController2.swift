//
//  ViewController2.swift
//  CompendiumV2
//
//  Created by Field Employee on 2/19/21.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var describeView: UITextView!
    
    var monsterImage = UIImageView()
    var monsterDescribe = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = monsterImage.image;
        describeView.text = monsterDescribe.text;
        // Do any additional setup after loading the view.
    }

}
