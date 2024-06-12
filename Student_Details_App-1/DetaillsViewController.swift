import UIKit

class DetaillsViewController: UIViewController {
    
    var data: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Set up UI
        setupUI()
        
        // Load student data
        loadData()
    }
    
     func setupUI() {
        
         
         
        
        
        // Image view
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFit
        view.addSubview(profileImageView)
        
        // Name label
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(nameLabel)
        
        // Roll number label
        let rollNoLabel = UILabel()
        rollNoLabel.translatesAutoresizingMaskIntoConstraints = false
        rollNoLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(rollNoLabel)
        
        // Date of Birth label
        let dobLabel = UILabel()
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        dobLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(dobLabel)
        
        // Contact number label
        let contactLabel = UILabel()
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(contactLabel)
        
        // Standard label
        let standardLabel = UILabel()
        standardLabel.translatesAutoresizingMaskIntoConstraints = false
        standardLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(standardLabel)
        
         
         nameLabel.textColor = .white
         rollNoLabel.textColor = .white
         dobLabel.textColor = .white
         contactLabel.textColor = .white
         standardLabel.textColor = .white
         
         
         
        // Constraints
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            rollNoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            rollNoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rollNoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dobLabel.topAnchor.constraint(equalTo: rollNoLabel.bottomAnchor, constant: 10),
            dobLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dobLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contactLabel.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 10),
            contactLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            standardLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10),
            standardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            standardLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
         guard let student = data else { return }
         
         // Update UI with student data
         profileImageView.image = student.image
         nameLabel.text = "Name: \(student.name)"
         rollNoLabel.text = "Roll Number: \(student.rollNo)"
         
         let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dobLabel.text = "Date of Birth: \(dateFormatter.string(from: student.dob))"
         
         contactLabel.text = "Contact Number: \(student.contactNo)"
         standardLabel.text = "Standard: \(student.standard)"
    }
    
    private func loadData() {
       
    }
}
