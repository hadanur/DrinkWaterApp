//
//  CoreDataManager.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserProfile")

    private init() { }
    
    func saveName(name: String) -> Bool {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: context)
        
        newUser.setValue(UUID(), forKey: "id")
        newUser.setValue(name, forKey: "name")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func saveGender(gender: Bool) -> Bool {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: context)
        
        newUser.setValue(UUID(), forKey: "id")
        newUser.setValue(gender, forKey: "gender")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func saveWeight(weight: String) -> Bool {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: context)
        
        newUser.setValue(UUID(), forKey: "id")
        newUser.setValue(weight, forKey: "weight")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    
    
    func getProfile() -> [User]? {
        var userProfile = [User]()
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let weight = result.value(forKey: "weight") as? String,
                   let id = result.value(forKey: "id") as? UUID,
                   let gender = result.value(forKey: "gender") as? Bool,
                   let name = result.value(forKey: "name") as? String {
                    let user = User(name: name, weight: weight, id: id, gender: gender)
                    userProfile.append(user)
                }
            }
            return userProfile
        } catch {
            print("error")
            return nil
        }
    }
    
    func deleteProfile() {
        
        if let results = try? context.fetch(fetchRequest) {
            for result in results {
                context.delete(result as! NSManagedObject)
            }
        }
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
}
