//
//  ListViewController.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/05.
//

import UIKit
import RxSwift
import RxCocoa

final class ListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var additionalButton: UIBarButtonItem!
    
    private var fruits: [Fruit] {
        viewModel.outputs.fruits
    }
    private let viewModel: ViewModelType = ListViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupBindings()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    private func setupBindings() {
        additionalButton.rx.tap
            .subscribe(onNext: viewModel.inputs.additionalButtonDidTapped)
            .disposed(by: disposeBag)

        viewModel.outputs.event
            .drive(onNext: { [weak self] event in
                switch event {
                    case .presentAdditionalFruitVC:
                        let additionalFruitVC = AdditionalFruitViewController.instantiate()
                        additionalFruitVC.delegate = self
                        let navigationController = UINavigationController(rootViewController: additionalFruitVC)
                        navigationController.modalPresentationStyle = .fullScreen
                        self?.present(navigationController, animated: true, completion: nil)
                    case .reloadData:
                        self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier
        ) as! CustomTableViewCell
        let fruit = fruits[indexPath.row]
        cell.configure(fruit: fruit)
        return cell
    }
    
}

extension ListViewController: AdditionalFruitVCDelegate {
     
    func saveButtonDidTapped(name: String?) {
        viewModel.inputs.saveButtonDidTapped(name: name) 
    }
    
}
