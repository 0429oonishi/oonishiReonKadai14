//
//  AdditionalFruitViewModel.swift
//  
//
//  Created by 大西玲音 on 2021/08/08.
//

import Foundation

protocol AdditionalFruitViewModelInput {
    
}

protocol AdditionalFruitViewModelOutput: AnyObject {
    
}

protocol AdditionalFruitViewModelType {
    var inputs: AdditionalFruitViewModelInput { get }
    var outputs: AdditionalFruitViewModelOutput { get }
}

final class AdditionalFruitViewModel: AdditionalFruitViewModelInput,
                                      AdditionalFruitViewModelOutput {
    
}

extension AdditionalFruitViewModel: AdditionalFruitViewModelType {
    
    var inputs: AdditionalFruitViewModelInput {
        return self
    }
    
    var outputs: AdditionalFruitViewModelOutput {
        return self
    }
    
}
