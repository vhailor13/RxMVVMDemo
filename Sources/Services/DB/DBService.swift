//
//  DBService.swift
//  RxMVVMDemo
//
//  Created by Victor Sukochev on 29/12/2018.
//  Copyright © 2018 Victor. All rights reserved.
//

import RealmSwift
import RxRealm
import RxSwift

class DBService
{
    static let shared = DBService()
    
    fileprivate let realm: Realm
    
    fileprivate init()
    {
        self.realm = try! Realm(configuration: .defaultConfiguration)
    }
    
    func add(_ object: Object)
    {
        Observable.from(object: object)
            .subscribe(self.realm.rx.add())
    }
    
    func fetchSubscriptions() -> Observable<[Subscription]>
    {
        let subscriptions = self.realm.objects(Subscription.self)
        return Observable.array(from: subscriptions)
    }
}
