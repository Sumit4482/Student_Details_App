# Student Manager App Readme

This iOS application, developed in Swift, serves as a student manager, enabling users to view a list of students, add new student details, and view individual student information.

## Features

- **Tab Bar Navigation:** Utilizes a UITabBarController for easy navigation between different functionalities.

### First Tab: Student List

- **Student List:** Presented in a UITableView, displaying student photos and names. Swipe gestures are enabled for deleting students from the list.
- **Navigation:** Clicking on any student row navigates to the second screen.

### Second Tab: Add Student Details

- **Add Student Form:** Enables users to input student details such as age and date of birth. Frontend text field validation ensures the correctness of user input.
- **Photo Picker:** Allows users to select a photo from the device library to associate with the student.
- **User Defaults:** Form data is automatically saved using UserDefaults. If the user exits the app while filling out the form, the data will be retrieved upon relaunching.

## Screenshots

<div align="center">
  <img src="https://github.com/Sumit4482/Student_Details_App/assets/61246873/7f611245-e358-49bc-bb79-f21f90fc06f7" alt="Screen A" width="250"/>
  <img src="https://github.com/Sumit4482/Student_Details_App/assets/61246873/cee727e2-d1f4-4570-b0e7-6294a700aa37" alt="Screen B" width="250"/>
  <img src="https://github.com/Sumit4482/Student_Details_App/assets/61246873/acc93911-c165-404e-8bd4-eb0547678688" alt="Screen C" width="250"/>
  <img src="https://github.com/Sumit4482/Student_Details_App/assets/61246873/84b62f09-b5a5-4034-a7fe-ee4648f695eb" alt="Screen C" width="250"/>
  <img src="https://github.com/Sumit4482/Student_Details_App/assets/61246873/d3255e1e-540b-45b5-9ec4-78dff0f03546" alt="Screen C" width="250"/>
</div>


