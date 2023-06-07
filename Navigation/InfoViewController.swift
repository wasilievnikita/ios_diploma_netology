//
//  InfoViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 06.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: 125, y: 100, width: 150, height: 30)
        button.setTitle("купить?", for: .normal)
        button.backgroundColor = .white
        view.addSubview(button)
        button.addTarget(self, action: #selector(addAlert), for: .touchUpInside)
    }
    
    @objc func addAlert() {
        let allert = UIAlertController(title: "Welcome", message: "Welcome!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) {_ in
            print("Подверждение")
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel) {_ in
            print("Отмена")
        }
        
        allert.addAction(cancelAction)
        allert.addAction(okAction)
        
        present(allert, animated: true)
    }
}
