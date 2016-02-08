//
//  SwitchCell.swift
//  Yelp
//
//  Created by Mariella Sypa on 2/6/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

// creating our own delegate
// naming convention: ClassNameDelegate
@objc protocol SwitchCellDelegate {
    // first func is name of thing firing event
    // first param is switchCell itself
    // second is named parameter
    // optional if someone's not interested in event
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}


class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    // ? means delegate may or may not exist
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func switchValueChanged() {
        print("switch value changed")
        if delegate != nil {
            // ? means if delegate implements switch cell, call it
            delegate!.switchCell?(self, didChangeValue: onSwitch.on)
        }
    }
}
