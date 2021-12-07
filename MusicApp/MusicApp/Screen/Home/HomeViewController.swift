//
//  HomeViewController.swift
//  MusicApp
//
//  Created by ChuoiChien on 12/3/21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    
    @IBOutlet weak var sanPhamMoiCollectionView: UICollectionView!
    @IBOutlet weak var nhatDinhPhaiNgheCollectionView: UICollectionView!
    @IBOutlet weak var baiHatPhoBienCollectionView: UICollectionView!
    @IBOutlet weak var playListPhoBienCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    var listSanPhamMoiNhat = [MusicModel]()
    var listNhatDinhPhaiNghe = [MusicModel]()
    var listBaiHatPhoBien = [MusicModel]()
    var playListPhoBien = [MusicModel]()
    var listDJ = [SingerModel]()
    
    fileprivate let sectionInset = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(TopDJCell.self)
        tableView.separatorStyle = .none

        // collectionView
        sanPhamMoiCollectionView.delegate = self
        sanPhamMoiCollectionView.dataSource = self
        sanPhamMoiCollectionView.registerCellNib(SanPhamMoiCollectionViewCell.self)
        nhatDinhPhaiNgheCollectionView.delegate = self
        nhatDinhPhaiNgheCollectionView.dataSource = self
        nhatDinhPhaiNgheCollectionView.registerCellNib(NhatDinhPhaiNgheCollectionViewCell.self)
        baiHatPhoBienCollectionView.delegate = self
        baiHatPhoBienCollectionView.dataSource = self
        baiHatPhoBienCollectionView.registerCellNib(BaiHatPhoBienCollectionViewCell.self)
        playListPhoBienCollectionView.delegate = self
        playListPhoBienCollectionView.dataSource = self
        playListPhoBienCollectionView.registerCellNib(PlayListPhoBienCollectionViewCell.self)
        
        // fake data
        let item1 = MusicModel()
        item1.name = "Remix - Lạc Trôi"
        item1.singer = "Sơn Tùng MTP"
        item1.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listSanPhamMoiNhat.append(item1)
        listSanPhamMoiNhat.append(item1)
        listSanPhamMoiNhat.append(item1)
        listSanPhamMoiNhat.append(item1)
        listSanPhamMoiNhat.append(item1)
        
        let item2 = MusicModel()
        item2.name = "Anh Thanh Niên"
        item2.singer = "HuyR"
        item2.pathURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvjHKHtbxsThTZ_-vAc41t9Nt5m0ehtgNGvmYosqn4xYMtzNGHn3a7ngUkxqzAXCZ1LFU&usqp=CAU"
        listNhatDinhPhaiNghe.append(item2)
        listNhatDinhPhaiNghe.append(item2)
        listNhatDinhPhaiNghe.append(item2)
        listNhatDinhPhaiNghe.append(item2)
        
        let item3 = MusicModel()
        item3.name = "Cô Thắm Không về"
        item3.singer = "Phát Hồ & Emily"
        item3.pathURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr8nPfHoY9FW60sj9s35ZnICSlsp71aL6kqA&usqp=CAU"
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        listBaiHatPhoBien.append(item3)
        
        playListPhoBien.append(item1)
        playListPhoBien.append(item1)
        playListPhoBien.append(item1)
        
        let singer1 = SingerModel()
        singer1.stt = "1"
        singer1.name = "Sơn Tùng MTP"
        singer1.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listDJ.append(singer1)
        
        let singer2 = SingerModel()
        singer2.stt = "2"
        singer2.name = "Soobin Hoàng Sơn"
        singer2.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listDJ.append(singer2)
        
        let singer3 = SingerModel()
        singer3.stt = "3"
        singer3.name = "Trang Moon"
        singer3.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listDJ.append(singer3)
        
        let singer4 = SingerModel()
        singer4.stt = "4"
        singer4.name = "Mie"
        singer4.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listDJ.append(singer4)
        
        let singer5 = SingerModel()
        singer5.stt = "5"
        singer5.name = "Max"
        singer5.pathURL = "https://static.wikia.nocookie.net/rapviet/images/c/c7/Mtp.jpg/revision/latest?cb=20190703144520&path-prefix=vi"
        listDJ.append(singer5)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 150, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sanPhamMoiCollectionView {
            return listSanPhamMoiNhat.count
        } else if collectionView == nhatDinhPhaiNgheCollectionView {
            return listNhatDinhPhaiNghe.count
        } else if collectionView == baiHatPhoBienCollectionView {
            return listBaiHatPhoBien.count
        } else if collectionView == playListPhoBienCollectionView {
            return playListPhoBien.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sanPhamMoiCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SanPhamMoiCollectionViewCell", for: indexPath) as? SanPhamMoiCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = listSanPhamMoiNhat[indexPath.item]
            if item.pathURL != "" {
                cell.img.kf.setImage(with: URL.init(string: item.pathURL))
            }
            cell.name.text = item.name
            cell.singer.text = item.singer
            return cell
        } else if collectionView == nhatDinhPhaiNgheCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NhatDinhPhaiNgheCollectionViewCell", for: indexPath) as? NhatDinhPhaiNgheCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = listNhatDinhPhaiNghe[indexPath.item]
            if item.pathURL != "" {
                cell.img.kf.setImage(with: URL.init(string: item.pathURL))
            }
            cell.name.text = item.name
            cell.singer.text = item.singer
            return cell
        } else if collectionView == baiHatPhoBienCollectionView {
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
        } else if collectionView == playListPhoBienCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListPhoBienCollectionViewCell", for: indexPath) as? PlayListPhoBienCollectionViewCell else {
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
        return UICollectionViewCell()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDJ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.className(TopDJCell.self)) as! TopDJCell
        let item = listDJ[indexPath.row]
        cell.stt.text = item.stt
        if item.pathURL != "" {
            cell.img.kf.setImage(with: URL.init(string: item.pathURL))
        }
        cell.singer.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
