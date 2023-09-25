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
    

    
    private init() { }
    
    func saveProfile(name: String, gender: Bool, weight: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: context)
        
        newUser.setValue(UUID(), forKey: "id")
        newUser.setValue(name, forKey: "name")
        newUser.setValue(weight, forKey: "weight")
        newUser.setValue(gender, forKey: "gender")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func getProfile() -> [User]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserProfile")

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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserProfile")
        
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
    
    func addingWaterData(water: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let addingWater = NSEntityDescription.insertNewObject(forEntityName: "AddWater", into: context)
        
        addingWater.setValue(UUID(), forKey: "id")
        addingWater.setValue(water, forKey: "water")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func getWaterData() -> [AddingWater]?  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AddWater")
        
        var waterData = [AddingWater]()
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let water = result.value(forKey: "water") as? String,
                   let id = result.value(forKey: "id") as? UUID {
                    let water = AddingWater(water: water, id: id)
                    waterData.append(water)
                }
            }
            return waterData
        } catch {
            print("error")
            return nil
        }
        
    }
    
    func deleteWaterData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AddWater")
        
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
    
    func DailyWaterCalculate(ml: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let dailyWater = NSEntityDescription.insertNewObject(forEntityName: "DailyWater", into: context)
        
        dailyWater.setValue(UUID(), forKey: "id")
        dailyWater.setValue(ml, forKey: "ml")
        do {
            try context.save()
            return true
        } catch {
            print("Hata")
            return false
        }
    }
    
    func dailyWaterReset() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyWater")
        
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
    
    func getDailyWaterData() -> [Daily]?  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyWater")
        
        var dailyWater = [Daily]()
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let ml = result.value(forKey: "ml") as? String,
                   let id = result.value(forKey: "id") as? UUID {
                    let ml = Daily(ml: ml, id: id)
                    dailyWater.append(ml)
                }
            }
            return dailyWater
        } catch {
            print("error")
            return nil
        }
        
    }
}
