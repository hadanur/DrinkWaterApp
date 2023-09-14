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
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")

    private init() { }
    
    func saveProfile(name: String, height: Int, weight: Int) -> Bool {
        let newProfile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context)
        
        newProfile.setValue(height, forKey: "height")
        newProfile.setValue(UUID(), forKey: "id")
        newProfile.setValue(weight, forKey: "weight")
        newProfile.setValue(name, forKey: "name")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func getProfile() -> [ProfileModel]? {
        var profile = [ProfileModel]()
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let height = result.value(forKey: "height") as? Int,
                   let weight = result.value(forKey: "weight") as? Int,
                   let id = result.value(forKey: "id") as? UUID,
                   let name = result.value(forKey: "name") as? String {
                    let user = ProfileModel(name: name, height: height,
                                            weight: weight, id: id)
                                            
                    profile.append(user)
                }
            }
            return profile
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
