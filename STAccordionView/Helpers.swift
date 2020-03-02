//
//  Helpers.swift
//  STAccordionView
//
//  Created by Saim on 02/03/2020.
//  Copyright © 2020 Saim. All rights reserved.
//

import Foundation
import UIKit
class IntrinsicTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}
