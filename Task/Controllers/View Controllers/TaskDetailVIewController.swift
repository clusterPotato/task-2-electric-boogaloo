import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //MARK: - properties
    var task: Task?
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let _task = task{
            saveExistingTask(task: _task)
        }else{
            saveNewTask()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
    }
    
    
    //MARK: - custom funcs
    private func updateViews(){
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        if let date = task.dueDate{ //if it has a due date, put it in
            taskDueDatePicker.date = date
        }
    }
    func saveExistingTask(task:Task){
        guard let title = taskNameTextField.text else {return}
        TaskController.shared.update(task: task, name: title, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
    }
    func saveNewTask(){
        guard let title = taskNameTextField.text, !title.isEmpty else {return}
        TaskController.shared.createTaskWith(name: title, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
        
        
    }
    /*nil
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
