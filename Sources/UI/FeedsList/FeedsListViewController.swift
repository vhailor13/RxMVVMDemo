//
//  FeedsListViewController.swift
//  RxMVVMDemo
//
//  Created by Victor Sukochev on 29/12/2018.
//  Copyright © 2018 Victor. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedsListViewController: UIViewController
{
    fileprivate var viewModel: FeedsListViewModelProtocol!
    fileprivate let bag = DisposeBag()
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.bindModel()
    }

    
    @IBAction fileprivate func onAdd() {
        self.viewModel.addSubscription(url: "test")
    }
    
    // MARK: -
    
    fileprivate func bindModel()
    {
        self.viewModel = FeedsListViewModelDefault()
        
        self.viewModel.subscriptions?.bind(to: self.tableView.rx.items(cellIdentifier: "feeds_list_cell", cellType: FeedsListCell.self)) { (_, subscription, cell) in
            cell.titleLabel.text = subscription.title
        }.disposed(by: bag)
    }

}

