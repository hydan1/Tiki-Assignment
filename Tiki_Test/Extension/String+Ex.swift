//
//  String+Ex.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
    
    // Calculate the width based on constrained height (for 1 or 2 lines)
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font],
                                            context: nil)
        return ceil(boundingBox.width)
    }
    
    func hasMoreThanOneWord() -> Bool {
        let words = self.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        return words.count > 1
    }
}
