//
//  ViewController.swift
//  TabBarMenuLab
//
//  Created by Linconl Rufino on 08/09/23.
//

import UIKit

class MainController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    @objc func didTapButton(){
        let tabBarVC = UITabBarController()
        
        let flagVC = UINavigationController(rootViewController: FlagViewController())
        let starWarsVC = UINavigationController(rootViewController: StarWarsViewController())
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
        layout.minimumLineSpacing  = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        let gridVC = UINavigationController(rootViewController: GridCollectionViewController(collectionViewLayout: layout))
        
        flagVC.title = "Guess The Flag"
        starWarsVC.title = "Star Wars"
        gridVC.title = "Grid"
        
        tabBarVC.setViewControllers([flagVC, starWarsVC, gridVC], animated: false)
        
        tabBarVC.tabBar.tintColor = .black
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.isTranslucent = false
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["flag", "star", "table"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    func setupLayout(){
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 52),
            button.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}


//func createTabBar() -> UITabBarController {
//
//    let tabBar = UITabBarController()
//    let flagVC = createFlagViewController()
//    let viewVC1 = createHomeNavigationController()
//
//    tabBar.viewControllers = [flagVC, viewVC1]
//
//    return tabBar
//}
//
//func createFlagViewController() -> FlagViewController {
//    let flagVC = FlagViewController()
//    flagVC.title = "Guess The Flag"
//    flagVC.tabBarItem = UITabBarItem(title: "GuessTheFlag", image: UIImage(systemName: "flag"), tag: 0)
//
//    return flagVC
//}
//func createUIViewController1() -> UIViewController {
//    let xpto1VC = UIViewController()
//    xpto1VC.title = "XPTO - 1"
//    xpto1VC.view.backgroundColor = .systemBlue
//    xpto1VC.tabBarItem = UITabBarItem(title: "XPTO1", image: nil, tag: 1)
//
//    return xpto1VC
//}
//func createHomeNavigationController() -> UINavigationController {
//
//    let homeVC = UIViewController()
//    homeVC.title = "Home"
//    homeVC.view.backgroundColor = .systemPink
//    homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//
//    return UINavigationController(rootViewController: homeVC)
//}
