//
//  AdditionalFruitViewController.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import UIKit

protocol AdditionalFruitVCDelegate: AnyObject {
    func saveButtonDidTapped(name: String)
}

final class AdditionalFruitViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    weak var delegate: AdditionalFruitVCDelegate?
    
    static func instantiate() -> AdditionalFruitViewController {
        let storyboard = UIStoryboard(name: "AdditionalFruit", bundle: nil)
        let additionalFruitVC = storyboard.instantiateViewController(
            identifier: String(describing: self)
        ) as! AdditionalFruitViewController
        return additionalFruitVC
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {
        guard let name = textField.text,
              !name.isEmpty else { return }
        delegate?.saveButtonDidTapped(name: name)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
