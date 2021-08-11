//
//  FruitList.swift
//  oonishiReonKadai14
//
//  Created by 大西玲音 on 2021/08/11.
//

import Foundation

private extension Fruit {
    static let sampleData = [Fruit(name: "りんご", isChecked: false),
                             Fruit(name: "みかん", isChecked: true),
                             Fruit(name: "ぶどう", isChecked: false),
                             Fruit(name: "もも", isChecked: true)]
}

final class FruitList {
    
    private(set) var fruits: [Fruit] = Fruit.sampleData
    
    func append(fruit: Fruit) {
        fruits.append(fruit)
    }
    
}
