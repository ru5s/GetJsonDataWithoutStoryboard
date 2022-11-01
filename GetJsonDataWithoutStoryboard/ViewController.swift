//
//  ViewController.swift
//  GetJsonDataWithoutStoryboard
//
//  Created by Ruslan Ismailov on 01/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var idOfPost: String = "1"
    
    let secondVC = SecondViewController()
    
    var sendDataString: String?
    
    let mainLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight(0.5))
        label.textColor = .white
        label.text = "Welcome to Rest upload app from https://jsonplaceholder.typicode.com"
        label.numberOfLines = 3
        label.textAlignment = .center
        
        return label
    }()
    
    let textField: UITextField = {
        var tF = UITextField()
        tF.translatesAutoresizingMaskIntoConstraints = false
        tF.placeholder = "  Enter number of id from 0 to 100"
        tF.backgroundColor = .white
        tF.borderStyle = .line
        tF.textColor = .darkGray
        tF.keyboardType = .numberPad
        tF.borderStyle = .none
        tF.layer.cornerRadius = 10
        
        return tF
    }()
    
    let pushTheBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Push to upload".uppercased(), for: .normal)
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitleColor(.tintColor, for: .highlighted)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        print(sendDataString as Any)
        
        view.addSubview(mainLabel)
        view.addSubview(textField)
        view.addSubview(pushTheBtn)
        
        pushTheBtn.addTarget(self, action: #selector(pushBtn), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 60).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        textField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.bounds.width - 100).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        pushTheBtn.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive = true
        pushTheBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushTheBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pushTheBtn.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc func pushBtn(){
        
        secondVC.id = (textField.text)!
        
        secondVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(pushBackBtn))
        secondVC.navigationItem.leftBarButtonItem?.tintColor = .white
        
        let navCVC = UINavigationController(rootViewController: secondVC)
        navCVC.navigationBar.barTintColor = .darkGray
        
        navCVC.modalTransitionStyle = .coverVertical
        navCVC.modalPresentationStyle = .fullScreen
        present(navCVC, animated: true)
    }
    
    @objc private func pushBackBtn(){
        dismiss(animated: true)
    }
    
}


