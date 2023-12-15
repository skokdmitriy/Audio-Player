//
//  TrackListAssembly.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 13.12.2023.
//

import UIKit.UIViewController

final class TrackListAssembly {
    static func build() -> UIViewController {
        let router = TrackListRouter()
        let viewModel = TrackListViewModel(router: router)
        let viewController = TrackListViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
