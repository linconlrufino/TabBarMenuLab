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
        let tabBarVC = createAndConfigureTabBar()
        
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
    
    func createAndConfigureTabBar() -> UITabBarController {
        let tabBarVC = UITabBarController()
        
        tabBarVC.tabBar.tintColor = .black
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.modalPresentationStyle = .fullScreen
        
        let flagVC = createFlagViewController()
        let starWarsVC = createStarWarsViewController()
        let gridVC = createGridViewController()
        
        tabBarVC.setViewControllers([flagVC, starWarsVC, gridVC], animated: false)
        
        if let items = tabBarVC.tabBar.items {
            let images = ["flag", "star", "table"]
            
            for x in 0..<items.count {
                items[x].image = UIImage(systemName: images[x])
            }
        }

        return tabBarVC
    }
    
    func createFlagViewController() -> UINavigationController {
        let flagVC = UINavigationController(rootViewController: FlagViewController())
        flagVC.title = "Guess The Flag"

        return flagVC
    }
    
    func createStarWarsViewController() -> UINavigationController {
        let starWarsVC = UINavigationController(rootViewController: StarWarsViewController())
        starWarsVC.title = "Star Wars"

        return starWarsVC
    }

    func createGridViewController() -> UINavigationController {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
        layout.minimumLineSpacing  = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        let gridVC = UINavigationController(rootViewController: GridCollectionViewController(collectionViewLayout: layout))
        gridVC.title = "Grid"
        
        return gridVC
    }
}
