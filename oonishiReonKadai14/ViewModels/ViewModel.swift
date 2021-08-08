//
//  ViewModel.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/08.
//

import Foundation

protocol ViewModelInput {
    
}

protocol ViewModelOutput: AnyObject {
    
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {
    
}

extension ViewModel: ViewModelType {
    
    var inputs: ViewModelInput {
        return self 
    }
    
    var outputs: ViewModelOutput {
        return self
    }
    
}
