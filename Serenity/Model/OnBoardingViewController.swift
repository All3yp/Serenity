//
//  OnBoardingViewController.swift
//  Serenity
//
//  Created by Gilberto Magno on 01/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//
import UIKit

let dados = UserDefaults.standard

extension UIColor {
    static var mainRed = UIColor(red: 200/255, green: 50/255, blue: 33/255, alpha: 1)
    static var justRed =  UIColor(red: 216/255, green: 156/255, blue: 65/255, alpha: 1)
    
}


class OnBoardingViewController: UIViewController {


    private let primeiroTextFil: UITextField = {
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
        //textFil.dictationRecognitionFailed()
        //textFil.delegate = self
        return textFil
    }()
    
    private let primeiroButton: UIButton = {
        let Button = UIButton(type: .system)
        Button.setTitle("ANTERIOR", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        Button.setTitleColor(.gray, for: .normal)
        return Button
    }()

    private let segundoButton: UIButton = {
        let azulClaro = UIColor(red: 200/255, green: 50/255, blue: 33/255, alpha: 1)
        let Button = UIButton(type: .system)
        Button.setTitle("PRÓXIMO", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        Button.setTitleColor(azulClaro, for: .normal)
        return Button
    }()
    
    private let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = 3
        control.currentPageIndicatorTintColor =  .mainRed

        control.pageIndicatorTintColor = .justRed
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        setUpButtonControls()
        setUpTextFil()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .white
        
        
        
        
        //while true{}
    }
    
    fileprivate func setUpButtonControls() {
        //view.addSubview(primeiroButton)
        //primeiroButton.frame = CGRect(x:0, y: 0, width: 200, height: 200)
        //primeiroButton.backgroundColor = .blue
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
//        let greenView = UIView()
//        greenView.backgroundColor = .green
//        let redView = UIView()
//        redView.backgroundColor = .red
        
        let bottomControlView = UIStackView(arrangedSubviews: [primeiroButton,pageControl, segundoButton])
        bottomControlView.distribution = .fillEqually
        bottomControlView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlView)
        NSLayoutConstraint.activate([
            bottomControlView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),bottomControlView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),bottomControlView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),bottomControlView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpTextFil() {
        primeiroTextFil.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(primeiroTextFil)
        NSLayoutConstraint.activate([
            primeiroTextFil.bottomAnchor.constraint(equalTo: primeiroTexto.topAnchor),primeiroTextFil.leadingAnchor.constraint(equalTo: primeiroTexto.leadingAnchor),
            primeiroTextFil.trailingAnchor.constraint(equalTo: primeiroTexto.trailingAnchor),primeiroTextFil.heightAnchor.constraint(equalToConstant: 34)
        ])
        
    }
    
        
        let texto = ["""
Escute músicas e
pratique exercícios
 para relaxar
""","Como podemos te chamar?","Deseja adicionar algum contato para emergências?"]
        let primeiraImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "Ipad_1"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        let primeiroTexto: UITextView = {
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
        
        //Cuidado com os principios de encapsulamento nas suas classes viu !
        private func configure() {
        view.addSubview(primeiroTexto)
       // view.addSubview(primeiraImageView)
        
   
        
        let topImageContainer = UIView()
       // topImageContainer.backgroundColor = .blue
        view.addSubview(topImageContainer)
       // topImageContainer.frame = CGRect(x:0,y:0,width: 100,height: 100)
        // enable auto layout
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        topImageContainer.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        topImageContainer.addSubview(primeiraImageView)
        primeiraImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        primeiraImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        primeiraImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.75).isActive = true
//        topImageContainer.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
//        topImageContainer.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        primeiroTexto.topAnchor.constraint(equalTo:topImageContainer.bottomAnchor).isActive = true
        primeiroTexto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.frame.width*(-24/414)).isActive = true
        primeiroTexto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  view.frame.width*(24/414)).isActive = true
        primeiroTexto.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1).isActive = true
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

