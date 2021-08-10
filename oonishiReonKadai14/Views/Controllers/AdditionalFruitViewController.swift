//
//  AdditionalFruitViewController.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import UIKit
import RxSwift
import RxCocoa

protocol AdditionalFruitVCDelegate: AnyObject {
    func saveButtonDidTapped(name: String?)
}

final class AdditionalFruitViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var saveButton: UIBarButtonItem!
    @IBOutlet private weak var cancelButton: UIBarButtonItem!
    
    weak var delegate: AdditionalFruitVCDelegate?
    private let viewModel: AdditionalFruitViewModelType = AdditionalFruitViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    private func setupBindings() {
        saveButton.rx.tap
            .subscribe(onNext: viewModel.inputs.saveButtonDidTapped)
            .disposed(by: disposeBag)
        
        cancelButton.rx.tap
            .subscribe(onNext: viewModel.inputs.cancelButtonDidTapped)
            .disposed(by: disposeBag)
        
        viewModel.outputs.event
            .drive(onNext: { [weak self] event in
                switch event {
                    case .noticeToVC:
                        self?.delegate?.saveButtonDidTapped(name: self?.textField.text)
                    case .dismiss:
                        self?.dismiss(animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
    
    static func instantiate() -> AdditionalFruitViewController {
        let storyboard = UIStoryboard(name: "AdditionalFruit", bundle: nil)
        let additionalFruitVC = storyboard.instantiateViewController(
            identifier: String(describing: self)
        ) as! AdditionalFruitViewController
        return additionalFruitVC
    }
    
}
