//
//  CustomHeaderView.swift
//  Navigation
//
//  Created by Никита Васильев on 25.04.2023.
//

import UIKit

final class CustomHeaderView: UIView {
    
    private let headerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .brown
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
//        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    func setupHeader(text: String) {
//        headerTextLabel.text = text
//    }
//
//    private func layout() {
//        addSubview(headerTextLabel)
//
//        NSLayoutConstraint.activate([
//            headerTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//            headerTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            headerTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
//            headerTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
//        ])
//    }
}

