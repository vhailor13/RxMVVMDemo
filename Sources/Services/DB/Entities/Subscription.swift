//
//  Subscription.swift
//  RxMVVMDemo
//
//  Created by Victor Sukochev on 29/12/2018.
//  Copyright © 2018 Victor. All rights reserved.
//

import RealmSwift

class Subscription: Object
{
    @objc dynamic var title: String!
    @objc dynamic var url: String!
}
