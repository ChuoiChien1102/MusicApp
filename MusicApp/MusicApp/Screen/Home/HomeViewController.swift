//
//  HomeViewController.swift
//  MusicApp
//
//  Created by ChuoiChien on 12/3/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var listSanPhamMoiNhat = [MusicModel]()
    var listNhatDinhPhaiNghe = [MusicModel]()
    var listBaiHatPhoBien = [MusicModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.registerCellNib(HeaderSection.self)
        tableView.registerCellNib(SanPhamMoiCell.self)
        tableView.registerCellNib(NhatDinhPhaiNgheCell.self)
        tableView.registerCellNib(BaiHatPhoBienCell.self)
        tableView.separatorStyle = .none
        
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
        item2.pathURL = "https://i.ytimg.com/vi/HPL74s4VPdk/maxresdefault.jpg"
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
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderSection") as! HeaderSection
        headerCell.frame = headerView.bounds
        switch section {
        case 0:
            headerCell.name.text = "Sản phẩm mới nhất"
            break;
        case 1:
            headerCell.name.text = "Nhất định phải nghe"
            break;
        case 2:
            headerCell.name.text = "Bài hát phổ biến"
            break;
        default:
            break;
        }
        
        headerView.addSubview(headerCell)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // san pham moi nhat
            let cell = tableView.dequeueReusableCell(withIdentifier: String.className(SanPhamMoiCell.self)) as! SanPhamMoiCell
            cell.listSanPhamMoiNhat = listSanPhamMoiNhat
            return cell
        } else if indexPath.section == 1 {
            // nhất định phải nghe
            let cell = tableView.dequeueReusableCell(withIdentifier: String.className(NhatDinhPhaiNgheCell.self)) as! NhatDinhPhaiNgheCell
            cell.listNhatDinhPhaiNghe = listNhatDinhPhaiNghe
            return cell
        } else if indexPath.section == 2 {
            // bài hát phổ biến
            let cell = tableView.dequeueReusableCell(withIdentifier: String.className(BaiHatPhoBienCell.self)) as! BaiHatPhoBienCell
            cell.listBaiHatPhoBien = listBaiHatPhoBien
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String.className(SanPhamMoiCell.self)) as! SanPhamMoiCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
