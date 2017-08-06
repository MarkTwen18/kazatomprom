//
//  KazAtomExtension.swift
//  kazatom
//
//  Created by Ильяр Мнаждин on 8/6/17.
//  Copyright © 2017 Ilyar Mnazhdin. All rights reserved.
//

import UIKit

extension KazAtomCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDataSource
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if segmentedControler.selectedSegmentIndex != 0 {
            return groupsData.count
        }
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if segmentedControler.selectedSegmentIndex != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groupId, for: indexPath) as! GroupCollectionViewCell
            
            let item = groupsData[indexPath.item]
            cell.fakeImage.image = UIImage(named: item.imageName)
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indicatorId, for: indexPath) as! IndicatorCollectionViewCell
        
        let item = data[indexPath.item]
        cell.fakeImage.image = UIImage(named: item.imageName)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if segmentedControler.selectedSegmentIndex != 0 {
            let width = (view.frame.width - 2) / 2
            return CGSize(width: width, height: width - 32)
        }
        
        return CGSize(width: view.frame.width, height: 184)
    }
    
    // Horizontally 1px between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // Vertically 1px between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
