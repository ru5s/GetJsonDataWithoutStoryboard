//
//  SecondViewController.swift
//  GetJsonDataWithoutStoryboard
//
//  Created by Ruslan Ismailov on 01/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var id: String = "1"
    
    let textView: UITextView = {
        var view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.textColor = .white
        view.font = UIFont(name: "Helvetica", size: 25)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        view.backgroundColor = .darkGray
    }
    
    override func viewDidLayoutSubviews() {
        let safeArrea = view.layoutMarginsGuide
        
        textView.leftAnchor.constraint(equalTo: safeArrea.leftAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalTo: safeArrea.rightAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: safeArrea.bottomAnchor, constant: 0).isActive = true
        textView.topAnchor.constraint(equalTo: safeArrea.topAnchor, constant: 0).isActive = true
    }

    
    func fetchDataString(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(id)")
        guard let requestUrl = url else { return }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"



        let task = URLSession.shared.dataTask(with: request){(data, response, error) in
        guard let data = data,
           let dataString = String(data: data, encoding: .utf8),
           (response as? HTTPURLResponse)?.statusCode == 200,
           error == nil else {return}

        print(dataString)
            DispatchQueue.main.sync {
                self.textView.text = dataString
            }
        }
        task.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if textView.text.count > 0 {
            textView.text = ""
        }
        fetchDataString()
    }
}

