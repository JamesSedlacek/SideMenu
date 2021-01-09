//
//  MainVC.swift
//  sideMenu
//
//  Created by James Sedlacek on 1/8/21.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: - Variables
    
    var delegate: menuDelegate?

    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main")
    }
    
    //MARK: - Actions

    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        self.delegate?.toggleSideMenu(to: nil)
    }
}

//MARK: - menuDelegate

extension MainVC: menuDelegate {
    func toggleSideMenu(to option: menuOption?) {
        switch option {
        case .home:
            self.delegate?.toggleSideMenu(to: nil)
        case .notifications:
            performSegue(withIdentifier: "showNotifications", sender: nil)
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
