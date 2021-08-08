//
//  CustomTableViewCell.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    func configure(fruit: Fruit) {
        let image = fruit.isChecked ? UIImage(systemName: "checkmark") : nil
        checkButton.setImage(image, for: .normal)
        nameLabel.text = fruit.name
    }
    
    @IBAction func checkButtonDidTapped(_ sender: Any) {
        print(#function)
    }
    
}
