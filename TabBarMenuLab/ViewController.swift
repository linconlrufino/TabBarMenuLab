//
//  ViewController.swift
//  TabBarMenuLab
//
//  Created by Linconl Rufino on 08/09/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tabBar : UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupLayout()
    }
    
    func setupLayout(){
        view = UIView()
        
        view.addSubview(tabBar)
        
        setupTabBar()
        
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupTabBar() {
        
            let tab1 = UITabBarItem(title: "GuessTheFlag", image: nil, tag: 0)
            let tab2 = UITabBarItem(title: "Navigation", image: nil, tag: 1)
            let tab3 = UITabBarItem(title: "TableAndCollection", image: nil, tag: 2)
            
            tabBar.items = [tab1, tab2, tab3]
            
            tabBar.selectedItem = tab1
            
            // Configure as ações para responder às mudanças de guia
            tabBar.delegate = self
            
            // Crie instâncias dos controladores de visualização para cada guia
            let viewController1 = FlagViewController()
            let viewController2 = UIViewController()
            let viewController3 = UIViewController()
            
            viewController1.title = "GuessTheFlag"
            viewController2.title = "Navigation"
            viewController3.title = "TableAndCollection"
            
            // Adicione os controladores de visualização como filhos do controlador principal
            addChild(viewController1)
            addChild(viewController2)
            addChild(viewController3)
        
            // Exiba o primeiro controlador de visualização por padrão
            view.addSubview(viewController1.view)
            
            // Configure as restrições para o controlador de visualização
            viewController1.view.translatesAutoresizingMaskIntoConstraints = false
            viewController1.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            viewController1.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            viewController1.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            viewController1.view.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true

        }
}

extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Esconda todos os controladores de visualização primeiro
        for childViewController in children {
            childViewController.view.isHidden = true
        }
        
        // Exiba o controlador de visualização correspondente à guia selecionada
        children[item.tag].view.isHidden = false
    }
}
