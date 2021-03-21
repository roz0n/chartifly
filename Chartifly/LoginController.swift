//
//  LoginController.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/20/21.
//

import UIKit

class LoginController: UIViewController {
    
    let button: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("   Login to Spotify   ", for: .normal)
        btn.titleLabel?.tintColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureButton()
    }
    
    @objc func loginButtonTapped() {
        print("Tapped login button!")
        loginToSpotify()
    }
    
    fileprivate func configureButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func loginToSpotify() {
        // TODO: Call SceneDelegate's connect method
        let scene = UIApplication.shared.connectedScenes.first

        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            DispatchQueue.main.async {
                sceneDelegate.connect()
            }
        }
    }
    
}
