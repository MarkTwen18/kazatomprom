//
//  KazAtomCollectionViewController.swift
//  kazatom
//
//  Created by Ильяр Мнаждин on 8/6/17.
//  Copyright © 2017 Ilyar Mnazhdin. All rights reserved.
//

import UIKit

class KazAtomCollectionViewController: UICollectionViewController {
    
    lazy var segmentedControler: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Показатели","Группы"])
        segment.sizeToFit()
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(didTappedToSegmentedController), for: .valueChanged)
        
        return segment
    }()
    
    let indicatorId = "indicatorId"
    let groupId = "groupId"
    
    let data: [Indicator] = [
        Indicator(imageName: "indicator1"),
        Indicator(imageName: "indicator2"),
        Indicator(imageName: "indicator3")
    ]
    
    let groupsData: [Group] = [
        Group(imageName: "group1"),
        Group(imageName: "group2"),
        Group(imageName: "group3"),
        Group(imageName: "group4"),
        Group(imageName: "group5"),
        Group(imageName: "group6"),
        Group(imageName: "group7")
    ]
    
    func didTappedToSegmentedController() {
        self.collectionView?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.tintColor = .white
        navBar.barTintColor = UIColor.rgb(red: 20, green: 95, blue: 153)
        navBar.barStyle = .blackOpaque
        self.navigationItem.titleView = segmentedControler
        
        collectionView?.backgroundColor = UIColor.mainBackground()
        
        // Register cell classes
        
        self.collectionView?.register(IndicatorCollectionViewCell.self, forCellWithReuseIdentifier: indicatorId)
        self.collectionView?.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: groupId)
        
    }

}
