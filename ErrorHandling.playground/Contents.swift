//: Playground - noun: a place where people can play

import UIKit

struct Person {
    let name: String
    let age: Int
}

struct PersonViewModel {
    var name: String?
    var age: String?
    
    enum InputError: Error {
        case InputMissing, AgeIncorrect
    }
    
    func createPerson() throws -> Person {
        
        guard let name = name, let age = age, name.characters.count > 0, age.characters.count > 0 else {
            throw InputError.InputMissing
        }
        
        guard let ageFormatted = Int(age) else {
           throw  InputError.AgeIncorrect
        }
        
        return Person(name: name, age: ageFormatted)
    }
}

class ViewController: UIViewController {
    
    var personViewModel = PersonViewModel()
    
    func submitButtonPressed() {
        personViewModel.name = "mark"
        personViewModel.age = "20"
        
        do {
            let person = try personViewModel.createPerson()
            print("Success: person created \(person)")
        }
        catch PersonViewModel.InputError.InputMissing {
            print("Input missing")
        }
        catch PersonViewModel.InputError.AgeIncorrect {
            print("Age missing")
        }
        catch {
            print("Something went Wrong")
        }
    }
}