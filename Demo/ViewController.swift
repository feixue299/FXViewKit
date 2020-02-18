//
//  ViewController.swift
//  Demo
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit
import FXViewKit

class ViewController: UIViewController {

    let lrView = LeftRightView<UILabel, UIButton>()
    let tbView = TopBottomView<UILabel, UIButton>()
    let testView = LeftRightView<LeftRightView<UILabel, UILabel>, UIButton>()
    let contentView = ContentView<UIView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lrView.backgroundColor = .systemPink
        lrView.leftView.text = "left"
        lrView.leftView.backgroundColor = .systemBlue
        lrView.rightView.addTarget(self, action: #selector(lrViewTap), for: .touchUpInside)
        lrView.rightView.backgroundColor = .green
        lrView.rightView.setTitle("right", for: .normal)
        
        lrView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lrView)
        NSLayoutConstraint.activate([
            lrView.leftAnchor.constraint(equalTo: view.leftAnchor),
            lrView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lrView.heightAnchor.constraint(equalToConstant: 44),
            lrView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        tbView.backgroundColor = .systemPink
        tbView.topView.text = "top"
        tbView.topView.backgroundColor = .systemBlue
        tbView.bottomView.addTarget(self, action: #selector(tbViewTap), for: .touchUpInside)
        tbView.bottomView.backgroundColor = .green
        tbView.bottomView.setTitle("bottom", for: .normal)
        
        tbView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tbView)
        NSLayoutConstraint.activate([
            tbView.topAnchor.constraint(equalTo: view.topAnchor),
            tbView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbView.widthAnchor.constraint(equalToConstant: 60),
            tbView.bottomAnchor.constraint(equalTo: lrView.topAnchor)
        ])
        
        testView.backgroundColor = .systemPink
        testView.leftView.leftView.text = "left------"
        testView.leftView.backgroundColor = .systemBlue
        testView.leftView.rightView.backgroundColor = .green
        testView.leftView.rightView.text = "right"
        testView.rightView.setTitle("???????????", for: .normal)
        testView.rightView.backgroundColor = .brown
        
        testView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(testView)
        NSLayoutConstraint.activate([
            testView.leftAnchor.constraint(equalTo: view.leftAnchor),
            testView.topAnchor.constraint(equalTo: lrView.bottomAnchor),
            testView.heightAnchor.constraint(equalToConstant: 44),
            testView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }

    @objc func lrViewTap() {
        lrView.edges.top = CGFloat(arc4random() % 10)
        lrView.edges.left = CGFloat(arc4random() % 10)
        lrView.edges.right = -CGFloat(arc4random() % 10)
        lrView.edges.bottom = -CGFloat(arc4random() % 10)
    }
    
    @objc func tbViewTap() {
        tbView.edges.top = CGFloat(arc4random() % 10)
        tbView.edges.left = CGFloat(arc4random() % 10)
        tbView.edges.right = -CGFloat(arc4random() % 10)
        tbView.edges.bottom = -CGFloat(arc4random() % 10)
    }

}

