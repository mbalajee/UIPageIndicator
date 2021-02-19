//
//  ViewController.swift
//  UIPageIndicator
//
//  Created by Balaji M on 2/18/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let container = UIView()
    private let button = UIButton()
    
    private let indicator = PageIndicator()
    
    private let size = 10
    
    private var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(container)
        view.addSubview(button)
        
        print("view did appear")
        
        container.snp.makeConstraints { c in
            c.left.top.right.equalToSuperview().inset(50)
            c.height.equalTo(40)
        }
        
        button.snp.makeConstraints { c in
            c.left.right.bottom.equalToSuperview().inset(100)
        }
        
        button.backgroundColor = UIColor.yellow
        button.setTitle("Next page", for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
        indicator.color = UIColor.blue
        indicator.selectedColor = UIColor.red
        indicator.indicators = size
        
        container.addSubview(indicator)
        
        indicator.snp.makeConstraints { $0.left.top.right.bottom.equalTo(container) }
    }
    
    @objc func nextPage() {
        if index == size - 1 {
            index = 0
        } else {
            index += 1
        }
        indicator.currentIndex = index
    }
}

