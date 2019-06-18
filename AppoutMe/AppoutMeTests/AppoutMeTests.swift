//
//  AppoutMeTests.swift
//  AppoutMeTests
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import XCTest
@testable import AppoutMe

class AppoutMeTests: XCTestCase {
    
    func testLoadImage(){
        let url = Bundle(for: type(of: self)).url(forResource: "profilePhoto", withExtension: "jpeg")
        guard let urlPhoto = url else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlPhoto) {
            if let image = UIImage(data: data ){
                XCTAssertNotNil(image, "Error load image")
            }
        } else {
            XCTFail()
        }
    }
    func testParseInfo(){
        let mainInfo = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = mainInfo else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertNotNil(json, "Error to parse data")
        } else {
            XCTFail()
        }
    }
    
    func testMainViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.firstName, "Ernesto")
            XCTAssertEqual(json?.lastName, "Mejia")
            XCTAssertEqual(json?.age, 23)
            XCTAssertEqual(json?.city, "CDMX")
            XCTAssertEqual(json?.schoolSummary.carreer, "Computer engineer")
        } else {
            XCTFail()
        }
    }
    
    func testSkillsViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.analyticalSkills.joined(separator: ","), "Research,Problem-solving,Organization,Communication,Creativity")
            XCTAssertEqual(json?.communicationSkills.joined(separator: ","), "Listening,Confidence,Honesty,Reflection,Respect")
            XCTAssertEqual(json?.computerSkills.joined(separator: ","), "MS Office,Google Drive,Email,Git,GNU/Linux,XCode,VMWare Workstation,E/R Studio,HTML,CSS")
        } else {
            XCTFail()
        }
    }
    
    func testWorkExperienceViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.workExperience.proteco.joined(separator: "."), "Duration: 1 year.Start Date: August 2017.Description: I was a scholarship holder in this program and my main functios were help to other students in problems of their school subjects and teach courses of different technologies.")
            XCTAssertEqual(json?.workExperience.sferea.joined(separator: "."), "Duration: 3 months.Start Date: May 2018.Description: Active participation on a web project, the project consisted on a platform for university students and tasks like queries, correction on the interface and documentations were made them by me.")
            XCTAssertEqual(json?.workExperience.telvista.joined(separator: "."), "Duration: 2 months.Start Date: June 2011.Description: Telephone Assistant on the Aeromexico’s campaign making reservations, changes and checking of flights.")
        } else {
            XCTFail()
        }
    }
    
    func testProgrammingLanguagesViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.programmingLanguages.swift, "10 months")
            XCTAssertEqual(json?.programmingLanguages.sql, "6 months")
            XCTAssertEqual(json?.programmingLanguages.javascript, "6 months")
            XCTAssertEqual(json?.programmingLanguages.php, "6 months")
            XCTAssertEqual(json?.programmingLanguages.python, "2 months")
        } else {
            XCTFail()
        }
    }
    
    func testSchoolSummaryViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.schoolSummary.university, "Facultad de Ingeniería (UNAM)")
            XCTAssertEqual(json?.schoolSummary.generation, 2015)
            XCTAssertEqual(json?.schoolSummary.summary, "I graduated in 2018. I specialized in the area of databases and mobile development. The way in which I graduated was taking a postgraduate course in mobile development in swift and this last experience was the one that brought me closer to the area of mobile development")
        } else {
            XCTFail()
        }
    }
    func testContactInfoViewDidLoadOk(){
        let info = Bundle(for: type(of: self)).url(forResource: "PersonalInfo", withExtension: "json")
        guard let urlInfo = info else {
            XCTFail()
            return
        }
        if let data = try? Data(contentsOf: urlInfo) {
            let json = Service.shared.parseToJSON(data: data)
            XCTAssertEqual(json?.contactInfo.email, "ernesto.edmv1104@gmail.com")
            XCTAssertEqual(json?.contactInfo.cellphone, "+52 5543871366")
            XCTAssertEqual(json?.contactInfo.personalGithub, "netosaurio11")
            XCTAssertEqual(json?.contactInfo.linkedIn, "linkedin.com/in/ernesto-daniel-mejia-valdiviezo-913493139")
        } else {
            XCTFail()
        }

    }
    

}
