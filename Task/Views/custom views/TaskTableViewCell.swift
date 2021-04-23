//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Gavin Craft on 4/21/21.
//

import UIKit

protocol TaskCompletionDelegate: class{
    func taskCellButtonTapped( _sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    //MARK: - iboutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIButton!
    //MARK: - boilerplate
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(_sender: self)
    }
    //MARK: - properties
    weak var delegate:TaskCompletionDelegate?
    var task:Task?
    func updateViews(){
        guard let task = task else {return}
        if(task.isComplete){
            imageLabel.setBackgroundImage(UIImage(named: "complete"), for: .normal)
            
        }else{
            imageLabel.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}
