//
//  BaiHatPhoBienCell.swift
//  BudgetPlanner
//
//  Created by ChuoiChien on 1/30/21.
//

import UIKit
import Kingfisher

class BaiHatPhoBienCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    private let itemsPerRow: CGFloat = 2
    fileprivate let sectionInset = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    var listBaiHatPhoBien = [MusicModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCellNib(BaiHatPhoBienCollectionViewCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension BaiHatPhoBienCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let paddingSpace = sectionInset.left * (itemsPerRow + 1)
//        let availableWidth = self.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
        
//        return CGSize(width: widthPerItem, height: widthPerItem * 1.5)
        return CGSize(width: 150, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBaiHatPhoBien.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaiHatPhoBienCollectionViewCell", for: indexPath) as? BaiHatPhoBienCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = listBaiHatPhoBien[indexPath.item]
        if item.pathURL != "" {
            cell.img.kf.setImage(with: URL.init(string: item.pathURL))
        }
        cell.name.text = item.name
        cell.singer.text = item.singer
        return cell
    }
    
}
