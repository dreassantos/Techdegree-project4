//  Entrents.swift
//  AmusementPark
//  Created by Andrea on 3/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.

import Foundation

enum EntrantType {
    case classic
    case vip
    case child
    case foodService
    case rideService
    case maintenance
    case manager
    case seasonPassholder
    case Senior
    case contracted
    case vendor
}

enum entrantErrors {
    case dateOfBirthMissing
    case addressIncomplete
}

class Entrant {
    
    var entrantType: EntrantType
    let firstName: String?
    let lastName: String?
    var dateOfBirth: Date?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(entrantType: EntrantType,
         firstName: String? = nil,
         lastName: String? = nil,
         dateOfBirth: Date? = nil,
         streetAddress: String? = nil,
         city: String? = nil,
         state: String? = nil,
         zipCode: Int? = nil) {
        self.entrantType = entrantType
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.streetAddress = streetAddress
        self.state = state
        self.zipCode = zipCode
    }
}

class Guest: Entrant {}

// Guests
class ClassicGuest: Guest {
    let pass = ClassicGuest()
    init() {
        super.init(entrantType: .classic)
    }
}
class VipGuest: Guest {
    let pass = VipPass()
    init() {
        super.init(entrantType: .vip)
    }
}

class ChildGuest: Guest {
    let pass = ChildPass()
    //Change to DATE
    init(dateOfBirth: Date ) {
        super.init(entrantType: .child)
        self.dateOfBirth = dateOfBirth
    }
    func validateDateOfBirth() {
        //TODO: Check date of birth must be under 5
    }
}

class SeasonPassHolder: Guest {
    let pass = SeasonPass()
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(entrantType: .seasonPassholder, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
    
}

class SeniorGuest: Guest {
    let pass = SeniorPass()
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        super.init(entrantType: .Senior, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}

//Employees
class Employee: Entrant {}

class HourlyEmployee: Employee {}

class FoodServicesEmployee: HourlyEmployee {
    let pass = FoodServicesPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .foodService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class RideServicesEmployee: HourlyEmployee {
    let pass = RideServicesPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .rideService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class MaintenanceEmployee: HourlyEmployee {
    let pass = MaintenancePass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .maintenance, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Manager: Employee {
    let pass = ManagerPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .manager, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Contractor: Employee {
    let pass = ContractorPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .contracted, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Vendor: Employee {
    let pass = VendorPass()
    let companyName: String
    let dateOfVisit: Int
    init(firstName:String, lastName:String, dateOfBirth:
        Date, companyName: String, dateOfVisit: Int){
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
        super.init(entrantType: .vendor, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}


extension Entrant {
    func swipeAtGate(at area: AreaAccess){
        let kiosk = Kiosk()
        kiosk.validateAccess(pass: self.pass, at: area)
    }
}

