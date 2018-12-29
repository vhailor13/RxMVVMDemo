//
//  FeedsListViewModel.swift
//  RxMVVMDemo
//
//  Created by Victor Sukochev on 29/12/2018.
//  Copyright © 2018 Victor. All rights reserved.
//

import RxSwift

protocol FeedsListViewModelProtocol
{
    var subscriptions: Observable<[Subscription]>? { get }
    
    func addSubscription(url: String)
}

class FeedsListViewModelDefault: FeedsListViewModelProtocol
{
    fileprivate let db = DBService.shared
    
    var subscriptions: Observable<[Subscription]>? {
        return db.fetchSubscriptions()
    }
    
    func addSubscription(url: String)
    {
        let subscription = Subscription()
        subscription.title = url
        subscription.url = url
        
        db.add(subscription)
    }
}
