//
//  Extensions.swift
//  SApp
//
//  Created by Yegor on 07.06.2021.
//

import Foundation
import UIKit

// for restrict index out of range array
extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
