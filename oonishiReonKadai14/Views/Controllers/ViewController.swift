//
//  ViewController.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/05.
//

import UIKit

private extension Fruit {
    static let sampleData = [Fruit(name: "りんご", isChecked: false),
                             Fruit(name: "みかん", isChecked: true),
                             Fruit(name: "ぶどう", isChecked: false),
                             Fruit(name: "もも", isChecked: true)]
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var fruits = Fruit.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func additionalButtonDidTapped(_ sender: Any) {
        let additionalFruitVC = AdditionalFruitViewController.instantiate()
        additionalFruitVC.delegate = self
        let navigationController = UINavigationController(rootViewController: additionalFruitVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let fruit = fruits[indexPath.row]
        cell.configure(fruit: fruit)
        return cell
    }
    
}

extension ViewController: AdditionalFruitVCDelegate {
    
    func saveButtonDidTapped(name: String) {
        fruits.append(Fruit(name: name, isChecked: false))
        tableView.reloadData()
    }
    
}
