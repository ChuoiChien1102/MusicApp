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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.registerCellNib(HeaderSection.self)
        tableView.registerCellNib(MonthTitleCell.self)
        tableView.separatorStyle = .none
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
        if section == 0 {
            let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0))
            return headerView
        }
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderSection") as! HeaderSection
        headerCell.frame = headerView.bounds
        if section == 1 {
            headerCell.name.text = "Đã nghe gần đây"
        } else if section == 2 {
            headerCell.name.text = "Nghệ sĩ mới"
        }
        headerView.addSubview(headerCell)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell title
        let cell = tableView.dequeueReusableCell(withIdentifier: String.className(MonthTitleCell.self)) as! MonthTitleCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
