//
//  ViewController.swift
//  TextViewDemo
//
//  Created by OFweek01 on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let textView = LZHTextView()
        textView.setPlaceHolder(holderStr: "占位文字")
        textView.layer.borderColor = UIColor.orange.cgColor
        textView.layer.borderWidth = 1.0
        //textView.backgroundColor = UIColor.orange
        textView.frame = CGRect.init(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 150)
        view.addSubview(textView)
    }

}

