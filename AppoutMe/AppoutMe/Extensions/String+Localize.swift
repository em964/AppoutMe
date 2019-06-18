//
//  String+Localize.swift
//  AppoutMe
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/17/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import UIKit

extension String {
    func localize() -> String{
        return NSLocalizedString(self, comment: "String not found")
    }
}
