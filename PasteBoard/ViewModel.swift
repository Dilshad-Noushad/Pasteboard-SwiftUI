//
//  ViewModel.swift
//  Demo1
//
//  Created by Dilshad N on 27/11/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var data: [Model] = []
    @Published var isNameCpyd: Bool = false
    
}
