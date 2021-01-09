//
//  NotificationsVC.swift
//  sideMenu
//
//  Created by James Sedlacek on 1/8/21.
//

import UIKit

class NotificationsVC: UIViewController {
    
    //MARK: - Variables
    
    var sideMenuOpen = false
    var delegate: menuDelegate?

    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions

    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        self.delegate?.toggleSideMenu(to: nil)
    }
}

//MARK: - menuDelegate

extension NotificationsVC: menuDelegate {
    func toggleSideMenu(to option: menuOption?) {
        switch option {
        case .home:
            performSegue(withIdentifier: "showHome", sender: nil)
            self.delegate?.toggleSideMenu(to: nil)
        case .notifications:
            self.delegate?.toggleSideMenu(to: nil)
        case .settings:
            print("GOTO Settings")
        case .about:
            print("GOTO About")
        default:
            break
        }
    }
}
