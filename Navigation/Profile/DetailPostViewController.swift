//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 25.05.2023.
//

import UIKit

class DetailPostViewController: UIViewController {

    weak var delegate: PlusLike?

    private var indexPathCell = IndexPath()
    
    func setIndexPath(indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var like: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func newSetup(model: Post) {
        photo.image = UIImage(named: model.photo)
        authorText.text = model.author
        descriptionText.text = model.description
        like.text = "Likes: " + String(model.likes)
        views.text = "Views: " + String(model.views + 1)
    }

    private func layout() {
    
        [ photo, authorText, descriptionText, like, views].forEach { view.addSubview($0)}
        let inset: CGFloat = 16
        let inset2: CGFloat = 12
        let heighInset : CGFloat = 50
        let height : CGFloat = 200
        
        NSLayoutConstraint.activate([

            authorText.topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            authorText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            authorText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            authorText.heightAnchor.constraint(equalToConstant: 30),
            
            photo.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: inset2),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photo.heightAnchor.constraint(equalToConstant: height),
            
            descriptionText.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: inset),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: heighInset),
            
            like.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: -inset),
            like.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            like.heightAnchor.constraint(equalToConstant: heighInset),
            
            views.topAnchor.constraint(equalTo: like.topAnchor),
            views.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            views.heightAnchor.constraint(equalToConstant: heighInset),
            views.bottomAnchor.constraint(equalTo: like.bottomAnchor)
        ])
        }
}
