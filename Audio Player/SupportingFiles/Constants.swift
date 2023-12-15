//
//  Constants.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 15.12.2023.
//

import UIKit

public enum Constants {
    static let formatTime = "%02d"
    static let cellIdentifier = "cell"
    static let heightForRow: CGFloat = 58
}

public enum Title {
    static let titleMain = "Music"
    static let close = "Close"
}

public enum Fonts {
    static let helveticaNeue = UIFont(name: "HelveticaNeue", size: 16)
    static let helveticaNeueBold = UIFont(name: "HelveticaNeue-Bold", size: 20)

}

public enum Images {
    static let pause = "pause"
    static let xmark = "xmark"
    static let forward = "forward.end"
    static let backward = "backward.end"
    static let play = "play"
}
