//
//  SwappingControl.swift
//  Serenity
//
//  Created by Gilberto Magno on 06/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        self.view.addSubview(collection)
        collection.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        return collection
    }()
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
        
    }
    
    let pages = [
        Page(imageName: "Ipad_1", headerText: "Receba Suporte Diário!", otherText: "\n\nPrátique exercícios e Escute música enquanto cuida da sua Saúde Mental!",temTextFil: false),
        Page(imageName: "Ipad_2", headerText: "Como podemos te chamar?", otherText: "\n\n",temTextFil: true),
        Page(imageName: "Ipad_3", headerText: "Deseja adicionar um contato de Emergência?", otherText: "",temTextFil: true),

    ]
//    let imageNames = ["Ipad_1","Ipad_2","Ipad_3"]
//    let headerStrings = ["Receba Suporte Diário!","Receba Suporte Diáriooo!"]
            //view.addSubview(primeiroButton)
            //primeiroButton.frame = CGRect(x:0, y: 0, width: 200, height: 200)
            //primeiroButton.backgroundColor = .blue
            
    //        let yellowView = UIView()
    //        yellowView.backgroundColor = .yellow
    //        let greenView = UIView()
    //        greenView.backgroundColor = .green
    //        let redView = UIView()
    //        redView.backgroundColor = .red
            
         let primeiroButton: UIButton = {
            let Button = UIButton(type: .system)
            Button.setTitle("ANTERIOR", for: .normal)
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            Button.setTitleColor(.gray, for: .normal)
            Button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
            return Button
        }()

         let segundoButton: UIButton = {
            let azulClaro = UIColor(red: 200/255, green: 50/255, blue: 33/255, alpha: 1)
            let Button = UIButton(type: .system)
            Button.setTitle("PRÓXIMO", for: .normal)
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            Button.setTitleColor(azulClaro, for: .normal)
            Button.addTarget(self, action: #selector(handlexNext), for: .touchUpInside)
            return Button
        }()
        
         lazy var pageControl: UIPageControl = {
            let control = UIPageControl()
            control.currentPage = 0
            control.numberOfPages = pages.count
            control.currentPageIndicatorTintColor =  .mainRed

            control.pageIndicatorTintColor = .justRed
            return control
        }()
        
        func setUpButtonControls() {
            let bottomControlView = UIStackView(arrangedSubviews: [primeiroButton,pageControl, segundoButton])
            bottomControlView.distribution = .fillEqually
            bottomControlView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlView)
            NSLayoutConstraint.activate([
                bottomControlView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),bottomControlView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),bottomControlView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),bottomControlView.heightAnchor.constraint(equalToConstant: 50)
            ])
        }

    @objc func handlexNext() {
        if pageControl.currentPage < pages.count - 1 {
            let nextIndex = min(pageControl.currentPage + 1,pageControl.numberOfPages - 1)
        pageControl.currentPage = nextIndex
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: IndexPath(index: pageControl.currentPage)) as! PageCell
            print(cell.primeiroTextFil.text!)
            dados.set(cell.primeiroTextFil.text!,forKey: "Nome")
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: IndexPath(index: pageControl.currentPage)) as! PageCell
            dados.set(cell.primeiroTextFil.text!,forKey: "Número")
            dismiss(animated: true, completion: nil)
            let story = UIStoryboard(name: "TabBar", bundle: nil)
                       let vc = story.instantiateViewController(identifier: "tabbar") as! TabBarViewController
                       vc.modalPresentationStyle = .fullScreen
                       present(vc, animated: true)
            UserDefaults.isNotFirstLaunch = true
        }
    }
    
    @objc func handlePrev() {
        let nextIndex = max(pageControl.currentPage-1,0)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
//    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        
//    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
//        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
//        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    override func viewDidLayoutSubviews() {
        if !UserDefaults.isFirstLaunch{
        super.viewDidLayoutSubviews()
        let story = UIStoryboard(name: "TabBar", bundle: nil)
        let vcs = story.instantiateViewController(identifier: "tabbar") as! TabBarViewController
        vcs.modalPresentationStyle = .fullScreen
        present(vcs, animated: false)
        }

    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
                setUpButtonControls()
        //        let randomViewController = UIViewController()
        //        randomViewController.view.backgroundColor = .purple
        //
               
        //registerKeyboard()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(gesture)
        
        setupConstraints()
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    @objc private func dismissKeyboard(_: UITextField) {
        view.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        cell.delegate = self
        
        let page = pages[indexPath.item]
        cell.page = page
        if indexPath.item == 0{
        cell.primeiroTextFil.isHidden = true
            cell.pageID = 0
        }
        if indexPath.item == 2 {
            cell.primeiroTextFil.keyboardType = .numberPad
            cell.pageID = 2
        }
        if indexPath.item == 1 {
            cell.pageID = 1
        }
    
        cell.primeiroTextFil.endEditing(true)
//        cell.primeiraImageView.image = UIImage(named: page.imageName)
//        cell.primeiroTexto.text = page.headerText
//        let imageName = imageNames[indexPath.item]
//        cell.primeiraImageView.image = UIImage(named: imageName)
//        let headerText = headerStrings[indexPath.item]
//        cell.primeiroTexto.text = headerText
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout colletionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
    
    
}


extension SwipingController: OnboardTextDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func sendText(text: String?, id: Int) {
        if id == 1{
        dados.set(text!,forKey: "Nome")
            print("deeeu")
        }else if id == 2{
            dados.set(text!,forKey: "Número")
        }
    }
}

