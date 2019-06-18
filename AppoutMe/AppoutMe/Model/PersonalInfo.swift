//
//  PersonalInfo.swift
//  AppoutMe
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import Foundation

// MARK: - PersonalInfo
class PersonalInfo: Codable {
    let firstName, lastName: String
    let age: Int
    let city: String
    let analyticalSkills, communicationSkills, computerSkills: [String]
    let contactInfo: ContactInfo
    let programmingLanguages: ProgrammingLanguages
    let schoolSummary: SchoolSummary
    let workExperience: WorkExperience
}

// MARK: - ContactInfo
class ContactInfo: Codable {
    let email, cellphone, personalGithub, linkedIn: String
}

// MARK: - ProgrammingLanguages
class ProgrammingLanguages: Codable {
    let swift, sql, javascript, php: String
    let python: String
}

// MARK: - SchoolSummary
class SchoolSummary: Codable {
    let university, carreer: String
    let generation: Int
    let summary: String
}

// MARK: - WorkExperience
class WorkExperience: Codable {
    let proteco, sferea, telvista: [String]
}
