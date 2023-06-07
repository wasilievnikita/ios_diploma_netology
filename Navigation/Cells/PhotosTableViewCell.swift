//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Никита Васильев on 28.04.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    let photosViewController =  {
           PhotosViewController()
       }()
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - making 4 photos
    
    private lazy var photo1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dog1")
        return imageView
    }()
    
    private lazy var photo2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dog2")
        return imageView
    }()
    
    private lazy var photo3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dog3")
        return imageView
    }()
    
    private lazy var photo4: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dog4")
        return imageView
    }()
    
    // MARK: - making Header
    
    private let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont.boldSystemFont(ofSize: 24)
        header.numberOfLines = 2
        header.text = "Photos"
        return header
    }()
    
    // MARK: - making arrow
    
    private let imageArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        [contentWhiteView, imageArrow, photo1, photo2, photo3, photo4, header].forEach { contentView.addSubview($0)}
    }

    // MARK: - Making Autolayouts
    
    func layout() {
        
        let inset: CGFloat = 12
        let inset2: CGFloat = 8
        let imageSize: CGFloat = (contentView.bounds.width + 3 * inset2)/4

        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageArrow.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -inset),
            imageArrow.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            imageArrow.widthAnchor.constraint(equalToConstant: 30),
            
            header.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: inset),
            header.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
            
            photo1.topAnchor.constraint(equalTo: header.bottomAnchor, constant: inset),
            photo1.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            photo1.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),
            photo1.heightAnchor.constraint(equalToConstant: imageSize),
            photo1.widthAnchor.constraint(equalToConstant: imageSize),
            
            photo2.topAnchor.constraint(equalTo: photo1.topAnchor),
            photo2.leadingAnchor.constraint(equalTo: photo1.trailingAnchor, constant: inset2),
            photo2.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),
            photo2.heightAnchor.constraint(equalToConstant: imageSize),
            photo2.widthAnchor.constraint(equalToConstant: imageSize),
            
            photo3.topAnchor.constraint(equalTo: photo1.topAnchor),
            photo3.leadingAnchor.constraint(equalTo: photo2.trailingAnchor, constant: inset2),
            photo3.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),
            photo3.heightAnchor.constraint(equalToConstant: imageSize),
            photo3.widthAnchor.constraint(equalToConstant: imageSize),
            
            photo4.topAnchor.constraint(equalTo: photo1.topAnchor),
            photo4.leadingAnchor.constraint(equalTo: photo3.trailingAnchor, constant: inset2),
            photo4.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),
            photo4.heightAnchor.constraint(equalToConstant: imageSize),
            photo4.widthAnchor.constraint(equalToConstant: imageSize),          
        ])
    }
    
//    let photosViewController =  {
//           PhotosViewController()
//       }()
}



