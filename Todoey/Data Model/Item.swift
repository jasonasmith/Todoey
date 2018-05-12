//
//  Item.swift
//  Todoey
//
//  Created by Jason Smith on 5/2/18.
//  Copyright © 2018 Jason Smith. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
