//
//  Category.swift
//  Todoey
//
//  Created by Jason Smith on 5/2/18.
//  Copyright © 2018 Jason Smith. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
