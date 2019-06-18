//
//  MainViewModel.swift
//  AppoutMe
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import UIKit

public class MainViewModel {
    var personalInfo: PersonalInfo!
    
    //MARK: - Main Info
    var firstName: String {
        return personalInfo.firstName
    }
    var lastName: String {
        return personalInfo.lastName
    }
    var age: String {
        return String(describing: personalInfo.age)
    }
    var city: String {
        return personalInfo.city
    }
    var carreer: String {
        return personalInfo.schoolSummary.carreer
    }
    
    //MARK: - Skills Info
    var analyticalSkills: [String]{
        return personalInfo.analyticalSkills
    }
    var communicationSkills: [String] {
        return personalInfo.communicationSkills
    }
    var computerSkills: [String] {
        return personalInfo.computerSkills
    }
    
    //MARK: - Work Experience
    var protecoJob: [String] {
        return personalInfo.workExperience.proteco
    }
    var sfereaJob: [String] {
        return personalInfo.workExperience.sferea
    }
    var telvistaJob: [String] {
        return personalInfo.workExperience.telvista
    }
    
    //MARK: - Programming Languages
    var  swift: String {
        return personalInfo.programmingLanguages.swift
    }
    var sql: String {
        return personalInfo.programmingLanguages.sql
    }
    var javaScript: String {
        return personalInfo.programmingLanguages.javascript
    }
    var php: String {
        return personalInfo.programmingLanguages.php
    }
    var python: String {
        return personalInfo.programmingLanguages.python
    }
    
    //MARK: - School Summary
    var university: String {
        return personalInfo.schoolSummary.university
    }
    var generation: String {
        return String(describing: personalInfo.schoolSummary.generation)
    }
    var summary: String {
        return personalInfo.schoolSummary.summary
    }
    
    //MARK: - Contact Info
    var email: String {
        return personalInfo.contactInfo.email
    }
    var cellPhone: String {
        return personalInfo.contactInfo.cellphone
    }
    var personalGithub: String {
        return personalInfo.contactInfo.personalGithub
    }
    var linkedIn: String {
        return personalInfo.contactInfo.linkedIn
    }
    
    //MARK: - Request for information
    func mainPetition(completion: @escaping (PersonalInfo?) -> Void){
        guard let myUrl = Service.url else { return }
        Service.shared.requestFrom(url: myUrl) { [weak self] (data, status) in
            if status == .success {
                guard let myData = data, let myInfo: PersonalInfo = Service.shared.parseToJSON(data: myData) else { return }
                self?.personalInfo = myInfo
                completion(myInfo)
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - Request for a photo
    func downloadImageFrom(completion: @escaping (UIImage?) -> Void){
        guard let myUrl = Service.urlPhoto else { return }
        Service.shared.requestPhotoFrom(url: myUrl) { [weak self] (data, status) in
            if status == .success {
                guard let myData = data, let myPhoto = UIImage(data: myData) else { return }
                completion(myPhoto)
            } else {
                completion(nil)
            }
        }
    }
    
}
