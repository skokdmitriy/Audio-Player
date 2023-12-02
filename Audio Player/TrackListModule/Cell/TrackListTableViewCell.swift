//
//  TrackListTableViewCell.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit

final class TrackListTableViewCell: UITableViewCell {

    @IBOutlet var titltLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!

    override func prepareForReuse() {
        titltLabel.text = nil
        durationLabel.text = nil
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(_ data: Track) {
        titltLabel.text = data.artist + " - " + data.title
        durationLabel.text = data.duration
    }
}
