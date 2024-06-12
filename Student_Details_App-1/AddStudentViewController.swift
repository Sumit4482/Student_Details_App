import UIKit


let standards = ["Class 1", "Class 2", "Class 3","Class 4","Class 5","Class 6","Class 7", "Class 8", "Class 9"]
var finalStandard: String = " "
var selectedImage = UIImage()

class AddStudentViewController: UIViewController,UITextFieldDelegate {
    
    // Labels Declaration
    let nameLabel = UILabel()
    let rollNoLabel = UILabel()
    let dobLabel = UILabel()
    let contactLabel = UILabel()
    let profileLabel = UILabel()
    let standardLabel = UILabel()
    

    // TextFields Declaration
    let nameTextField = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 8))
    let rollNoTextField = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 8))
    let contactTextField = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 8))
  
  
    
    
    // Other Components Declaration
    var standardPickerView = UIPickerView()
    let dobDatePicker = UIDatePicker()
    let imagePickerButton = UIButton(type: .system)
    let standardSelectButton = UIButton(type: .system)
    let submitbutton = UIButton()
    var previewImage = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        setupLabels()
        setupTextFields()
        setupDatePicker()
        setupButtons()
        setupImageView()
        setupLayout()
        
        nameTextField.delegate = self
        rollNoTextField.delegate = self
        contactTextField.delegate = self
        
        // Add target actions for saving data
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        rollNoTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        dobDatePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        
        retrieveFormData()
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        saveFormData()
    }

    @objc func datePickerChanged(_ datePicker: UIDatePicker) {
        saveFormData()
    }
    
    func saveFormData() {
        UserDefaults.standard.set(nameTextField.text, forKey: UserDefaultsKeys.name)
        UserDefaults.standard.set(rollNoTextField.text, forKey: UserDefaultsKeys.rollNo)
        UserDefaults.standard.set(contactTextField.text, forKey: UserDefaultsKeys.contactNo)
        UserDefaults.standard.set(dobDatePicker.date, forKey: UserDefaultsKeys.dob)
        UserDefaults.standard.set(finalStandard, forKey: UserDefaultsKeys.standard)
        if let imageData = selectedImage.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: UserDefaultsKeys.image)
        }
    }

    func retrieveFormData() {
        nameTextField.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.name)
        rollNoTextField.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.rollNo)
        contactTextField.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.contactNo)
        if let date = UserDefaults.standard.object(forKey: UserDefaultsKeys.dob) as? Date {
            dobDatePicker.date = date
        }
        finalStandard = UserDefaults.standard.string(forKey: UserDefaultsKeys.standard) ?? standards.first!
        if let imageData = UserDefaults.standard.data(forKey: UserDefaultsKeys.image) {
            selectedImage = UIImage(data: imageData) ?? UIImage(named: "user")!
        } else {
            selectedImage = UIImage(named: "user")!
        }
        previewImage.image = selectedImage
    }

    func setupLabels() {

        nameLabel.text = "Name :"
        rollNoLabel.text = "Roll No :"
        dobLabel.text = "Date of Birth :"
        contactLabel.text = "Contact No :"
        profileLabel.text = "Profile :"
        standardLabel.text = "Standard :"
        
        let labels = [nameLabel, rollNoLabel, dobLabel, contactLabel, profileLabel, standardLabel]
        labels.forEach { label in
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
        }
    }
    
    func setupTextFields() {
        let textFields = [nameTextField, rollNoTextField, contactTextField]
        textFields.forEach { textField in
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.layer.cornerRadius = 15.0
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.black.cgColor
            textField.backgroundColor = .white
            view.addSubview(textField)
        }
        
    }
    
    func setupDatePicker() {
        dobDatePicker.datePickerMode = .date
        dobDatePicker.backgroundColor = .white
        dobDatePicker.maximumDate = Date()
        dobDatePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dobDatePicker)
    }
    
    func setupButtons() {
        
        imagePickerButton.setTitle("Select Image", for: .normal)
        imagePickerButton.translatesAutoresizingMaskIntoConstraints = false
        imagePickerButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        view.addSubview(imagePickerButton)
        
       
        standardSelectButton.setTitle("Select", for: .normal)
        standardSelectButton.translatesAutoresizingMaskIntoConstraints = false
        standardSelectButton.backgroundColor = .white
        standardSelectButton.tintColor = .black
        standardSelectButton.addTarget(self, action: #selector(selectStandard), for: .touchUpInside)
        view.addSubview(standardSelectButton)
        
       
        submitbutton.translatesAutoresizingMaskIntoConstraints = false
        submitbutton.backgroundColor = .systemBlue
        submitbutton.setTitle("Submit Details", for: .normal)
        submitbutton.layer.cornerRadius = 5
        submitbutton.layer.borderWidth = 1
        submitbutton.layer.borderColor = UIColor.white.cgColor
        submitbutton.addTarget(self, action: #selector(addStudent), for: .touchUpInside)
        view.addSubview(submitbutton)
        
    }

    func setupImageView(){
        previewImage.image = UIImage(named: "user")
        previewImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(previewImage)
    }
    
    func setupLayout() {

        NSLayoutConstraint.activate([
            previewImage.heightAnchor.constraint(equalToConstant: 100),
            previewImage.widthAnchor.constraint(equalToConstant: 100),
            previewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            previewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 130),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            rollNoLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            rollNoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            rollNoLabel.widthAnchor.constraint(equalToConstant: 100),
            
            rollNoTextField.topAnchor.constraint(equalTo: rollNoLabel.bottomAnchor, constant: 10),
            rollNoTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            rollNoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rollNoTextField.heightAnchor.constraint(equalToConstant: 50),
            
            dobLabel.topAnchor.constraint(equalTo: rollNoTextField.bottomAnchor, constant: 20),
            dobLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dobLabel.widthAnchor.constraint(equalToConstant: 110),
            
            dobDatePicker.topAnchor.constraint(equalTo: rollNoTextField.bottomAnchor, constant: 12),
            dobDatePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 160),
            
            contactLabel.topAnchor.constraint(equalTo: dobDatePicker.bottomAnchor, constant: 20),
            contactLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactLabel.widthAnchor.constraint(equalToConstant: 110),
            
            contactTextField.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10),
            contactTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactTextField.heightAnchor.constraint(equalToConstant: 50),
            
            profileLabel.topAnchor.constraint(equalTo: contactTextField.bottomAnchor, constant: 20),
            profileLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            profileLabel.widthAnchor.constraint(equalToConstant: 90),
            
            imagePickerButton.topAnchor.constraint(equalTo: contactTextField.bottomAnchor, constant: 15),
            imagePickerButton.leadingAnchor.constraint(equalTo: profileLabel.leadingAnchor,constant: 80),
            imagePickerButton.widthAnchor.constraint(equalToConstant: 100),
            
            standardLabel.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 20),
            standardLabel.leadingAnchor.constraint(equalTo: profileLabel.leadingAnchor),
            standardLabel.widthAnchor.constraint(equalToConstant: 90),
            
            standardSelectButton.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 15),
            standardSelectButton.leadingAnchor.constraint(equalTo: standardLabel.leadingAnchor,constant: 120),
            standardSelectButton.widthAnchor.constraint(equalToConstant: 100),
            
            submitbutton.topAnchor.constraint(equalTo: standardSelectButton.bottomAnchor, constant: 50),
            submitbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            submitbutton.widthAnchor.constraint(equalToConstant: 350),
            submitbutton.heightAnchor.constraint(equalToConstant: 60),
        ])
            
    }
    
    @objc func addStudent(_ sender: Any) {
       
        guard let name = nameTextField.text, !name.isEmpty, name.rangeOfCharacter(from: CharacterSet.letters.union(.whitespaces).inverted) == nil else {
            showToast(message: "Invalid Name", font: .systemFont(ofSize: 12.0))
            return
        }

        guard let rollNo = rollNoTextField.text, !rollNo.isEmpty, Int(rollNo) != nil else {
            showToast(message: "Invalid Roll No", font: .systemFont(ofSize: 12.0))
            return
        }

        guard let contactNo = contactTextField.text, !contactNo.isEmpty, contactNo.count == 10, Int(contactNo) != nil else {
            showToast(message: "Invalid Contact No", font: .systemFont(ofSize: 12.0))
            return
        }

        let student = Student(
            name: name,
            rollNo: rollNo,
            image: selectedImage,
            dob: dobDatePicker.date,
            contactNo: contactNo,
            standard: finalStandard
        )
        
        students.append(student)
        print(student)
        showToast(message: "Student Added", font: .systemFont(ofSize: 12.0))
      
        nameTextField.text = ""
        rollNoTextField.text = ""
        contactTextField.text = ""
        previewImage.image = UIImage(named: "user")
        saveFormData()
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            let allowedCharacters = CharacterSet.letters.union(CharacterSet.whitespaces)
            return string.rangeOfCharacter(from: allowedCharacters) != nil || string.isEmpty
        } else if textField == rollNoTextField {
            // Allow only numbers
            let allowedCharacters = CharacterSet.decimalDigits
            return string.rangeOfCharacter(from: allowedCharacters) != nil || string.isEmpty
        } else if textField == contactTextField {
            // Allow only numbers and limit to 10 characters
            let allowedCharacters = CharacterSet.decimalDigits
            let currentText = textField.text ?? ""
            let newLength = currentText.count + string.count - range.length
            return (string.rangeOfCharacter(from: allowedCharacters) != nil || string.isEmpty) && newLength <= 10
        }
        return true
    }
    

   func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.black
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

  @objc func selectImage() {
        let alert = UIAlertController(title: "Select Image", message: nil, preferredStyle: .actionSheet)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .lightGray
           alert.view.tintColor = UIColor.white
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.openPhotoLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = false
            
            self.present(imagePickerController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Camera not available", message: "This device has no Camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func openPhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}
extension AddStudentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[.originalImage] as? UIImage {
            print("Image selected: \(chosenImage)")
            selectedImage = chosenImage
            previewImage.image = chosenImage
            self.showToast(message: "Image Selected", font: .systemFont(ofSize: 12.0))
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
extension AddStudentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
   
    @objc func selectStandard() {
        let alert = UIAlertController(title: "Select Standard", message: "\n\n\n\n", preferredStyle: .actionSheet)
        alert.view.tintColor = UIColor.white
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: alert.view.bounds.width - 20, height: 140))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .systemGray3
        pickerView.tintColor = .black
        
        alert.view.addSubview(pickerView)
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            print("Selected Standard: \(standards[selectedRow])")
            finalStandard = standards[selectedRow]
        }
        alert.addAction(doneAction)
        present(alert, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return standards.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return standards[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        standardSelectButton.setTitle(standards[row], for: .normal)
        print("Selected: \(standards[row])")
    }
}
