//
//  LoginWireframe.swift
//  VIper-v2-Demo
//
//  Created by Donik Vrsnak on 4/11/18.
//  Copyright (c) 2018 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "Login", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: LoginViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {

    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .home:
            _openHome()
        case .register:
            _presentRegister()
        }
        
    }
    
    private func _openHome() {
        let wireframe = HomeWireframe()
        
        navigationController?.pushWireframe(wireframe)
    }
    
    private func _presentRegister() {
        let wireframe = RegisterWireframe()
        
        let wireframeNavigationController = PokedexNavigationController()
        wireframeNavigationController.setRootWireframe(wireframe)
        
        navigationController?.present(wireframeNavigationController, animated: true, completion: nil)
        
    }

}
