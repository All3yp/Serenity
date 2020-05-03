//
//  OnBoardingViewController.swift
//  Serenity
//
//  Created by Gilberto Magno on 01/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//
import UIKit

let dados = UserDefaults.standard

class OnBoardingViewController: UIViewController {

    
    
    @IBOutlet weak var TextFil2: UITextField!
    
    @IBOutlet weak var TextFil: UITextField!
    
    
    @IBOutlet weak var oi: UILabel!
    
    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()
    

    @IBAction func isso(_ sender: Any) {
        core.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configure()
        
        
        
        //while true{}
    }
    
    
    
    private func configure() {
        
        
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        let texto = ["""
Escute músicas e
pratique exercícios
 para relaxar
""","Como podemos te chamar?","Deseja adicionar algum contato para emergências?"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // Image Button TextField
            
//            let sampleTextField = UITextField(frame: CGRect(x: 80, y: 428, width: pageView.frame.size.width-160, height: 30))
//           // textField.backgroundColor = .red
//            sampleTextField.font = UIFont.systemFont(ofSize: 15)
//            sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//            sampleTextField.autocorrectionType = UITextAutocorrectionType.no
//            sampleTextField.keyboardType = UIKeyboardType.default
//            sampleTextField.returnKeyType = UIReturnKeyType.done
//            sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//            sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//            sampleTextField.placeholder = "Enter text here"
//            //sampleTextField.delegate = self
//            if x>0{
//            pageView.addSubview(sampleTextField)
//            }
            
            
            //else{
                //pageView.didAddSubview(TextFil)
              //  pageView.addSubview(TextFil)
            //}
            TextFil.frame = CGRect(x: pageView.frame.size.width*(80/375),y: pageView.frame.size.height*(400/734),width: pageView.frame.size.width*(215/375),height: 34)
            TextFil2.frame = CGRect(x: pageView.frame.size.width*(80/375),y: pageView.frame.size.height*(400/734),width: pageView.frame.size.width*(215/375),height: 34)
            if x == 1 {
                            //TextFil.willMove(toSuperview: pageView)
                            //pageView.addSubview(TextFil)
            //                TextFil = UITextField( frame: CGRect(x:pageView.frame.size.width*(80/375), y: pageView.frame.size.height*(428/734), width: pageView.frame.size.width*(251/375), height: pageView.frame.size.height*(34/734)))
                
                            pageView.addSubview(TextFil)
                        }
                        if x == 2{
                            pageView.addSubview(TextFil2)
                        }
            let imageView = UIImageView(frame: CGRect(x:10 , y:TextFil.frame.minY-(pageView.frame.size.height*(344/734)), width: pageView.frame.size.width-20, height: pageView.frame.size.height*(344/734)))
            let Button = UIButton(frame: CGRect(x:10 , y: pageView.frame.size.height-80, width: pageView.frame.size.width-20, height: 50))
            let frase = UILabel(frame: CGRect(x: pageView.frame.size.width*(80/375), y: imageView.frame.maxY - 34, width: pageView.frame.size.width-2*pageView.frame.size.width*(80/375), height: 30))
            frase.text = texto[x]
            frase.numberOfLines = 3
            pageView.addSubview(frase)
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "Ipad_\(x+1)")
            pageView.addSubview(imageView)
            
            
            
            Button.setTitleColor(.white, for: .normal)
            Button.backgroundColor = .black
            Button.setTitle( "Continue" , for: .normal)
            if x == 2 {
                Button.setTitle( " Get started" , for: .normal)
            }
            Button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            Button.tag = x+1
            pageView.addSubview(Button)
            
            
            
            
            
        }
        // set scrollview
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: holderView.frame.size.height)
        scrollView.isPagingEnabled = true
        
    }
    
    


    
    @objc  func didTapButton(_ Button: AnyObject){
        guard (Button as! UIButton).tag  < 3 else {
            core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            dados.set(TextFil2.text!, forKey:"Número")
            return
        }
        if let x = Button as? UIButton {
            if x.tag == 2 {
                dados.set(TextFil.text!,forKey: "Nome")
            }
        }
        
        
        
//            guard (Button as! UIButton).tag  < 2 && (Button as! UIButton).tag > 2 else {
//            dados.set(TextFil.text!, forKey:"Nome")
//            return
//        }
//        guard (Button as AnyObject).tag > 1 && (Button as AnyObject).tag < 1 else {
//
//            return
     //   }
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width*CGFloat((Button as! UIButton).tag), y: 0), animated: true)
        //scroll to next page
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

