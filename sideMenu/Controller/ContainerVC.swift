//
//  ViewController.swift
//  sideMenu
//
//  Created by James Sedlacek on 1/8/21.
//

import UIKit

//MARK: - menuOptions

enum menuOption: Int {
    case home = 0
    case notifications = 1
    case settings = 2
    case about = 3
}

//MARK: - protocols

protocol menuDelegate {
    func toggleSideMenu(to option: menuOption?)
}

//MARK: - ContainerVC

class ContainerVC: UIViewController {
    
    //MARK: - Variables
    
    var sideMenuOpen = false
    var mainVC: MainVC?
    var notifVC: NotificationsVC?
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerWidth.constant = UIScreen.main.bounds.width
    }
    
    //MARK: - Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToNav" {
            if let nav = segue.destination as? UINavigationController {
                if let vc = nav.topViewController as? MainVC {
                    vc.delegate = self
                    mainVC = vc
                }
                if let vc = nav.topViewController as? NotificationsVC {
                    vc.delegate = self
                    notifVC = vc
                }
            }
        }
        
        else if segue.identifier == "SegueToMenu" {
            if let vc = segue.destination as? SideMenuVC {
                if mainVC != nil { vc.delegate = mainVC }
                else if notifVC != nil { vc.delegate = notifVC }
            }
        }
    }

}

//MARK: - menuDelegate

extension ContainerVC: menuDelegate {
    func toggleSideMenu(to option: menuOption?) {
        print("Toggling side menu: \(sideMenuOpen ? "Closing" : "Opening")" )
        
        // negative Width of the menu (Makes it disappear)
        menuLeadingConstraint.constant = sideMenuOpen ? -260 : 0

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.2,
                       options: .curveEaseInOut,
                       animations: {
            self.view.layoutIfNeeded()
        }) { (Finished) -> Void in
            self.sideMenuOpen.toggle()
        }
        
    }
}

