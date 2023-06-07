//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Васильев on 12.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private var leadingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightBackView = NSLayoutConstraint()
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    
    private let photoFrame: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "x.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseGesture)))
        return imageView
    }()
    
    private let signature: UILabel = {
        let signature = UILabel()
        signature.translatesAutoresizingMaskIntoConstraints = false
        signature.text = "Waiting for action..."
        signature.font = UIFont(name: "HelveticaNeue", size: 14)
        return signature
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Snoop Dogg"
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return name
    }()
    
    private lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 65
        imageView.image = UIImage(named: "snoopy")
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.textAlignment = .left
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.placeholder = "Введите статус..."
        return textField
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Показать статус", for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.backgroundColor = .systemBlue
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(signature)
        addSubview(name)
        addSubview(photo)
        addSubview(statusButton)
        addSubview(textField)
        addSubview(photoFrame)
        addSubview(backView)
        addSubview(photo)
        addSubview(closeAvatar)
    }
    
    @objc func buttonPressed() {
        if textField.text!.isEmpty {
            shakeAnimationStatus()
        } else {
            signature.text = textField.text
            textField.text = ""
        }
    }
    
    @objc func statusTextChanged(_ textfield: UITextField) {
        if let titleStatus = textField.text {
            statusText = titleStatus
        }
    }
    
    private func shakeAnimationStatus() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    private func layout() {
        
        leadingImageView = photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = photo.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = photo.widthAnchor.constraint(equalToConstant: 130)
        heightImageView = photo.heightAnchor.constraint(equalToConstant: 130)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        heightBackView = backView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightBackView])
        
        NSLayoutConstraint.activate([
            
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.topAnchor.constraint(equalTo: topAnchor),
            
            closeAvatar.widthAnchor.constraint(equalToConstant: 30),
            closeAvatar.heightAnchor.constraint(equalToConstant: 30),
            closeAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            photoFrame.widthAnchor.constraint(equalToConstant: 130),
            photoFrame.heightAnchor.constraint(equalToConstant: 130),
            photoFrame.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            photoFrame.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            name.leadingAnchor.constraint(equalTo: photoFrame.trailingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: photoFrame.topAnchor, constant: 27),
            name.widthAnchor.constraint(equalToConstant: 120),
            
            statusButton.topAnchor.constraint(equalTo: photoFrame.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            signature.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            signature.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
            signature.widthAnchor.constraint(equalToConstant: 150),
            
            textField.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            textField.widthAnchor.constraint(equalToConstant: 150),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -5),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photo.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.backView.isHidden = false
                self.widthImageView.constant = UIScreen.main.bounds.width - 20
                self.leadingImageView.constant = 10
                self.topImageView.constant = 150
                self.heightImageView.constant = UIScreen.main.bounds.width - 20
                self.heightBackView.constant =  UIScreen.main.bounds.height
                self.photo.layer.cornerRadius = 0
              
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.8) {
                self.closeAvatar.layer.opacity = 1
                self.backView.layer.opacity = 0.3
            }
        }
    }
    
    @objc private func tapCloseGesture() {
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeAvatar.layer.opacity = 0
                self.backView.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.backView.isHidden = false
                self.backView.isHidden = true
                self.photo.layer.cornerRadius = 65
                self.widthImageView.constant = 130
                self.leadingImageView.constant = 16
              
                self.topImageView.constant = 16
                self.heightImageView.constant = 130
                self.heightBackView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}
