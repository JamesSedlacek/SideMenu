//
//  SideMenuVC.swift
//  sideMenu
//
//  Created by James Sedlacek on 1/8/21.
//

import UIKit

class SideMenuVC: UITableViewController {
    
    //MARK: - Variables
    
    var delegate: menuDelegate?
    
    //MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Side menu")
    }

    //MARK: - TableView Functions

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case menuOption.home.rawValue:
            self.delegate?.toggleSideMenu(to: .home)
        case menuOption.notifications.rawValue:
            self.delegate?.toggleSideMenu(to: .notifications)
        case menuOption.settings.rawValue:
            self.delegate?.toggleSideMenu(to: .settings)
        case menuOption.about.rawValue:
            self.delegate?.toggleSideMenu(to: .about)
        default:
            break
        }
    }

}
