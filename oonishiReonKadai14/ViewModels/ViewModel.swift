//
//  ViewModel.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelInput {
    func additionalButtonDidTapped()
    func saveButtonDidTapped(name: String?)
}

protocol ViewModelOutput: AnyObject {
    var event: Driver<ViewModel.Event> { get }
    var fruits: [Fruit] { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {
    
    enum Event {
        case presentAdditionalFruitVC
        case reloadData
    }
    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }
    private let eventRelay = PublishRelay<Event>()
    
    func additionalButtonDidTapped() {
        eventRelay.accept(.presentAdditionalFruitVC)
    }
    
    func saveButtonDidTapped(name: String?) {
        guard let name = name,
              !name.isEmpty else { return }
        let fruit = Fruit(name: name, isChecked: false)
        fruits.append(fruit)
        eventRelay.accept(.reloadData)
    }
    
    var fruits: [Fruit] = Fruit.sampleData
    
}

extension ViewModel: ViewModelType {
    
    var inputs: ViewModelInput {
        return self 
    }
    
    var outputs: ViewModelOutput {
        return self
    }
    
}

private extension Fruit {
    static let sampleData = [Fruit(name: "りんご", isChecked: false),
                             Fruit(name: "みかん", isChecked: true),
                             Fruit(name: "ぶどう", isChecked: false),
                             Fruit(name: "もも", isChecked: true)]
}
