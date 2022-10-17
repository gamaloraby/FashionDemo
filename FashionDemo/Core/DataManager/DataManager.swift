//
//  DataManager.swift
//  FashionDemo
//
//  Created by gamal oraby on 16/10/2022.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    func createEntity (entityName: String, product: Product) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(product.name, forKey: "name")
        newUser.setValue(product.imageURL, forKey: "image")
        newUser.setValue(product.costPrice, forKey: "price")
        newUser.setValue(product.welcomeDescription, forKey: "descriptionText")
        newUser.setValue(product.id, forKey: "id")
        newUser.setValue(product.barcode, forKey: "barcode")
        newUser.setValue(product.retailPrice, forKey: "retailPrice")
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
    }
    
    func fetchData(entityName: String) -> [Item]? {
        let request = NSFetchRequest<Item>(entityName: entityName)
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed")
            return nil
        }
    }
    
    func clearDtat() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.execute(batchDeleteRequest)
        } catch {
            print("error in delete")
        }
    }
}
