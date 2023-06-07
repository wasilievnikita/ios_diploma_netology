//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кристина on 29.04.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func imageCellTaped(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: GalleryImages) {
        photo.image = UIImage(named: model.image)
    }
    
    private func addViews(){
        contentView.addSubview(photo)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photo.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.imageCellTaped(photo.image, frameImage: photo.frame, indexPath: indexPathCell)
    }

    }
