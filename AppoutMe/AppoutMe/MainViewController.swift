//
//  ViewController.swift
//  AppoutMe
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainView: MainView!
    @IBOutlet weak var skillsView: SkillsView!
    @IBOutlet weak var workExperienceView: WorkExperienceView!
    @IBOutlet weak var programmingLanguagesView: ProgrammingLanguagesView!
    @IBOutlet weak var schoolSummaryView: SchoolSummaryView!
    @IBOutlet weak var contactInfoView: ContactInfoView!
    
    var mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "main_title".localize()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        requestInfo()
        requestPhoto()
    }
    
    func configure(){
        self.configureMainView()
        self.configureSkillsview()
        self.configureWorkExperienceView()
        self.configureProgrammingLanguagesView()
        self.configureSchoolSummaryView()
        self.configureContactInfo()
    }

}
// MARK: - Extension for configure Views
extension MainViewController {
    
    // MARK: - Configure Main View
    func configureMainView(){
        mainView.roundCorners(radius: 30)
        mainView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        mainView.nameLbl.text = mainViewModel.firstName
        mainView.lastnameLbl.text = mainViewModel.lastName
        mainView.ageLbl.text = mainViewModel.age
        mainView.cityLbl.text = mainViewModel.city
        mainView.carrerLbl.text = mainViewModel.carreer
    }
    // MARK: - Configure Skills View
    func configureSkillsview(){
        skillsView.roundCorners(radius: 30)
        skillsView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        skillsView.titleSkills.text = "skills_title".localize()
        if let analitycalBase = skillsView.analitycalSkillsLbl.text, let communicationsBase = skillsView.communicationSkillsLbl.text, let computerBase = skillsView.computerSkillsLbl.text {
            skillsView.analitycalSkillsLbl.text = analitycalBase + " " + mainViewModel.analyticalSkills.joined(separator: ",")
            skillsView.communicationSkillsLbl.text = communicationsBase + " " + mainViewModel.communicationSkills.joined(separator: ",")
            skillsView.computerSkillsLbl.text = computerBase + " " + mainViewModel.computerSkills.joined(separator: ",")
        }
    }
    //MARK: - Configure Work Experience View
    func configureWorkExperienceView(){
        workExperienceView.roundCorners(radius: 30)
        workExperienceView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        workExperienceView.workExperienceTitle.text = "work_experience_title".localize()
        workExperienceView.protecoJobLbl.text = mainViewModel.protecoJob.joined(separator: ".")
        workExperienceView.sfereaJobLbl.text = mainViewModel.sfereaJob.joined(separator: ".")
        workExperienceView.telvistaJobLbl.text = mainViewModel.telvistaJob.joined(separator: ".")
    }
    
    //MARK: - Configure Programming Languages View
    func configureProgrammingLanguagesView(){
        programmingLanguagesView.roundCorners(radius: 30)
        programmingLanguagesView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        programmingLanguagesView.programmingLanguagesTitle.text = "programming_languages_title".localize()
        programmingLanguagesView.swiftInfoLbl.text = mainViewModel.swift
        programmingLanguagesView.sqlInfoLbl.text = mainViewModel.sql
        programmingLanguagesView.javascriptInfoLbl.text = mainViewModel.javaScript
        programmingLanguagesView.pythonInfoLbl.text = mainViewModel.python
        programmingLanguagesView.phpInfoLbl.text = mainViewModel.php
    }
    
    //MARK: - Configure School Summary View
    func configureSchoolSummaryView(){
        schoolSummaryView.roundCorners(radius: 30)
        schoolSummaryView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        schoolSummaryView.schoolSummaryTitle.text = "school_summary_title".localize()
        schoolSummaryView.universityLbl.text = mainViewModel.university
        schoolSummaryView.generationLbl.text = mainViewModel.generation
        schoolSummaryView.summaryLbl.text = mainViewModel.summary
    }
    
    //MARK: - Configure Contact Info View
    func configureContactInfo(){
        contactInfoView.roundCorners(radius: 30)
        contactInfoView.setGradientBackground(colorTop: .primaryColor, colorBottom: .secondColor)
        contactInfoView.contactInfoTitle.text = "contact_info_title".localize()
        contactInfoView.emailLbl.text = mainViewModel.email
        contactInfoView.cellphoneLbl.text = mainViewModel.cellPhone
        contactInfoView.githubLbl.text = mainViewModel.personalGithub
        contactInfoView.linkedInLbl.text = mainViewModel.linkedIn
    }
    
    //MARK: - Configure Photo
    func configurePhoto(){
        mainView.myPhoto.layer.cornerRadius = mainView.myPhoto.frame.size.width / 2.0
        mainView.myPhoto.clipsToBounds = true
    }
}
extension MainViewController {
    
    func requestInfo(){
        mainViewModel.mainPetition { [weak self] (PersonalInfo) in
            if let myInfo = PersonalInfo {
                DispatchQueue.main.async {
                    self?.configure()
                }
            } else {
                self?.showErrorAlert()
            }
        }
    }
    
    func requestPhoto(){
        mainViewModel.downloadImageFrom { [weak self] (UIImage) in
            DispatchQueue.main.async {
                self?.mainView.myPhoto.image = UIImage
                self?.configurePhoto()
            }
        }
    }
    func showErrorAlert(){
        let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { [weak self] (action) in
            self?.requestInfo()
            self?.requestPhoto()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

