//
//  PlayerRouter.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 14.12.2023.
//

import UIKit.UIViewController

final class PlayerRouter {
    weak var viewController: UIViewController?

    func showTrackList() {
        if let viewController = viewController {
            viewController.dismiss(animated: true)
        }
    }
}
