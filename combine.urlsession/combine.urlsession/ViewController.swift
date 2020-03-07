//
//  ViewController.swift
//  combine.urlsession
//
//  Created by Calvin Wong on 7/3/2020.
//  Copyright © 2020 Calvin Wong. All rights reserved.
//

import UIKit
import Combine
import CombineDataSources

struct Place: Decodable, Hashable {
    let name: String
    let desc: String
    let url: String
}

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var places = PassthroughSubject<[Place], Never>()
    var subscriptions = [AnyCancellable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Travel"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        places.bind(subscriber:
            tableView.rowsSubscriber(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self,
                cellConfig: { cell, indexPath, model in
                    cell.textLabel?.text = "\(model.name), \(model.desc)"
                }
            )
        )
        .store(in: &subscriptions)
                
        fetchData()
    }

    func fetchData() {
        if let url = URL(string: "https://api.myjson.com/bins/16w6h0") {
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [Place].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    print(completion) // finished
                }) { place in
                    self.places.send(place)
                }.store(in: &subscriptions)
        }
    }

}

