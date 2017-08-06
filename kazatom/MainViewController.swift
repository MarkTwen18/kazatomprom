//
//  MainViewController.swift
//  kazatom
//
//  Created by Ильяр Мнаждин on 8/6/17.
//  Copyright © 2017 Ilyar Mnazhdin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var kazAtomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "KazAtomProm"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.addTarget(self, action: #selector(handleOpenKazAtom), for: .touchUpInside)
        return button
    }()
    
    lazy var profilCompanyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "Profilnye"), for: .normal)
//        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.addTarget(self, action: #selector(handleOpenProfil), for: .touchUpInside)
        return button
    }()
    
    func handleOpenKazAtom(){
        print("kazatom")
        let kazAtomController = KazAtomCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(kazAtomController, animated: true)
    }
    
    func handleOpenProfil() {
        print("Profil")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIsettings()
    }
    
    private func UIsettings() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.tintColor = .white
        navBar.barTintColor = UIColor.rgb(red: 20, green: 95, blue: 153)
        navBar.barStyle = .blackOpaque
        
        view.backgroundColor = UIColor.rgb(red: 227, green: 243, blue: 245)
        
        
        view.addSubview(kazAtomButton)
        view.addSubview(profilCompanyButton)
        kazAtomButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 104, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 96)
        profilCompanyButton.anchor(top: kazAtomButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 32, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 96)
        
    }

}
