//
// Created by stringcode on 07/01/2021.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if within bounds, or nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
