//
//  PageCell.swift
//  Serenity
//
//  Created by Gilberto Magno on 06/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit

protocol OnboardTextDelegate: class {
    func sendText(text: String?, id: Int)
}

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            
            guard let unwrappedPage = page else {return}
            let atributtedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
            atributtedText.append(NSAttributedString(string:unwrappedPage.otherText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            primeiraImageView.image = UIImage(named: unwrappedPage.imageName)
            primeiroTexto.attributedText = atributtedText
            primeiroTexto.textAlignment = .center
            if unwrappedPage.temTextFil == false {
//                primeiroTextFil.isEnabled = false
//                primeiroTextFil.text = ""
//                primeiroTextFil.allowsEditingTextAttributes = false
//                primeiroTextFil.backgroundColor = .white
            }
        }
    }
    
    
    
    let primeiraImageView: UIImageView = {
      let imageView = UIImageView(image: UIImage(named: "Ipad_1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
     let primeiroTextFil: UITextField = {
        let textFil = UITextField()
        //textFil.backgroundColor = .red
        textFil.font = UIFont.systemFont(ofSize: 16)
        textFil.borderStyle = UITextField.BorderStyle.roundedRect
        textFil.autocorrectionType = UITextAutocorrectionType.no
        textFil.keyboardType = UIKeyboardType.default
        textFil.returnKeyType = UIReturnKeyType.done
        textFil.clearButtonMode = UITextField.ViewMode.whileEditing
        textFil.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFil.placeholder = "Enter text here"
        //textFil.delegate = self
        return textFil
    }()
    
    public let primeiroTexto: UITextView = {
                let texto1 = UITextView()
                let atributtedText = NSMutableAttributedString(string: "Receba Suporte Diário!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
                atributtedText.append(NSAttributedString(string: "\n\nPrátique exercícios e Escute música enquanto cuida da sua Saúde Mental!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
                texto1.attributedText = atributtedText
    //            texto1.text  = texto[0]
                texto1.translatesAutoresizingMaskIntoConstraints = false
                //texto1.font = UIFont.boldSystemFont(ofSize: view.frame.height*(18/896))
                texto1.textAlignment = .center
                texto1.isEditable = false
                texto1.isScrollEnabled = false
            
                return texto1
            }()
    
    
    
    
    weak var delegate: OnboardTextDelegate?
    var pageID: Int = 0
    
       func setUpTextFil() {
           primeiroTextFil.translatesAutoresizingMaskIntoConstraints = false
           self.addSubview(primeiroTextFil)
//           addSubview(primeiroTextFil)
//           NSLayoutConstraint.activate([
//               primeiroTextFil.bottomAnchor.constraint(equalTo: primeiroTexto.topAnchor, constant: 95),primeiroTextFil.leadingAnchor.constraint(equalTo: primeiroTexto.leadingAnchor),
//               primeiroTextFil.trailingAnchor.constraint(equalTo: primeiroTexto.trailingAnchor),primeiroTextFil.heightAnchor.constraint(equalToConstant: 34)
           
           
       }
    
    
    var primeiroTextFilBottomConstraint: NSLayoutConstraint!
    var originalConstantBottom: CGFloat = -190
    
    override func prepareForReuse() {
        self.frame = CGRect(origin: .zero, size: self.frame.size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpTextFil()
        self.addSubview(primeiraImageView)
        configure()
        setupObservers()
    }
    
    private func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDissapeared), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    @objc private func keyboardWillAppear(notification: Notification) {
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        UIView.animate(withDuration: 1) {
            self.primeiroTextFilBottomConstraint.constant = self.originalConstantBottom - keyboardSize.height
            self.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardDissapeared() {
        UIView.animate(withDuration: 1) {
            self.primeiroTextFilBottomConstraint.constant = self.originalConstantBottom
            self.layoutIfNeeded()
            self.delegate?.sendText(text: self.primeiroTextFil.text!, id: self.pageID)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
          //  view.addSubview(primeiroTexto)
           // view.addSubview(primeiraImageView)
            
       
            
            //let topImageContainer = UIView()
           // topImageContainer.backgroundColor = .blue
           // addSubview(topImageContainer)
           // topImageContainer.frame = CGRect(x:0,y:0,width: 100,height: 100)
            // enable auto layout
//            topImageContainer.translatesAutoresizingMaskIntoConstraints = false
//        topImageContainer.topAnchor.constraint(equalTo:topAnchor).isActive = true
//            topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//            topImageContainer.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
//            topImageContainer.addSubview(primeiraImageView)
//            primeiraImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
//            primeiraImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
//            primeiraImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.75).isActive = true
    //        topImageContainer.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
    //        topImageContainer.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
            //topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
            primeiroTextFilBottomConstraint = primeiroTextFil.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: originalConstantBottom)
            addSubview(primeiroTexto)
         NSLayoutConstraint.activate([primeiraImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         primeiraImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         primeiraImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
        primeiroTexto.topAnchor.constraint(equalTo: primeiraImageView.bottomAnchor, constant: 20),
            primeiroTexto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            primeiroTexto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            primeiroTextFil.topAnchor.constraint(equalTo: primeiroTexto.bottomAnchor, constant: 20),
            primeiroTextFil.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            primeiroTextFil.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            primeiroTextFilBottomConstraint
         ])
        }
    
    
    
}

extension PageCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.sendText(text: textField.text, id: 1)
    }
}
