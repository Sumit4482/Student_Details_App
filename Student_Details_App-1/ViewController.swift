import UIKit

var students: [Student] = []

class ViewController: UIViewController {
    
    let cellReuseIdentifier = "cell"
    @IBOutlet var tableView: UITableView!
    
    // Empty state label
    let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "No students available."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        title = "All Students"
        self.tableView.backgroundColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .black
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        view.addSubview(emptyStateLabel)
        setupEmptyStateLabelConstraints()
        
        updateEmptyState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        updateEmptyState()
    }
    
    private func setupEmptyStateLabelConstraints() {
        NSLayoutConstraint.activate([
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func updateEmptyState() {
        emptyStateLabel.isHidden = !students.isEmpty
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) ?? UITableViewCell()
        
        let student = students[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.text = "\(student.rollNo) \(student.name)"
        cell.textLabel?.textColor = .white
        cell.imageView?.image = student.image
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetaillsViewController else {
            return
        }
        
        vc.data = students[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateEmptyState()
        }
    }
}
