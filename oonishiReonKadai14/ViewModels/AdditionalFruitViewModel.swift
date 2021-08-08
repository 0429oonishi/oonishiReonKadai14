//
//  AdditionalFruitViewModel.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import RxSwift
import RxCocoa

protocol AdditionalFruitViewModelInput {
    func saveButtonDidTapped()
    func cancelButtonDidTapped()
}

protocol AdditionalFruitViewModelOutput: AnyObject {
    var event: Driver<AdditionalFruitViewModel.Event> { get }
}

protocol AdditionalFruitViewModelType {
    var inputs: AdditionalFruitViewModelInput { get }
    var outputs: AdditionalFruitViewModelOutput { get }
}

final class AdditionalFruitViewModel: AdditionalFruitViewModelInput,
                                      AdditionalFruitViewModelOutput {
    enum Event {
        case noticeToVC
        case dismiss
    }
    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }
    private let eventRelay = PublishRelay<Event>()
    
    func saveButtonDidTapped() {
        eventRelay.accept(.noticeToVC)
        eventRelay.accept(.dismiss)
    }
    
    func cancelButtonDidTapped() {
        eventRelay.accept(.dismiss)
    }
    
}

extension AdditionalFruitViewModel: AdditionalFruitViewModelType {
    
    var inputs: AdditionalFruitViewModelInput {
        return self
    }
    
    var outputs: AdditionalFruitViewModelOutput {
        return self
    }
    
}
