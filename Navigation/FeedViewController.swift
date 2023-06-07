//
//  ListViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 06.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var copyButton: UIButton = {
        let copyButton = UIButton(type: .system)
        copyButton.isUserInteractionEnabled = true
        copyButton.setTitle("Показать пост", for: .normal)
        copyButton.backgroundColor = .white
        copyButton.layer.cornerRadius = 4
        copyButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return copyButton
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemBlue
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(stackView)
    }
    
    @objc func showPost() {
     
        let postViewController = PostViewController()
    
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(copyButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

