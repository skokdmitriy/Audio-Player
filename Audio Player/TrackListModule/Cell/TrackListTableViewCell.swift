//
//  TrackListTableViewCell.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit

final class TrackListTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!

    override func prepareForReuse() {
        titleLabel.text = nil
        durationLabel.text = nil
    }
    
    func configureCell(_ data: Track) {
        titleLabel.text = data.artist + " - " + data.title
        durationLabel.text = data.duration
    }
}
