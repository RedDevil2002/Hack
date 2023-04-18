//
//  File.swift
//  
//
//  Created by Brian Seo on 2023-04-18.
//

import CoreData
import CloudKit

public extension Hack {
    final class PersistentController: ObservableObject {
        public let container: NSPersistentCloudKitContainer
        public var context: NSManagedObjectContext {
            container.viewContext
        }
        
        private let name: String
        
        public init(name: String, inMemory: Bool = false) {
            self.name = name
            container = NSPersistentCloudKitContainer(name: name)
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            }
            
            container.loadPersistentStores { desc, error in
                if let error = error {
                    fatalError(error.localizedDescription)
                }
            }
            container.viewContext.automaticallyMergesChangesFromParent = true
        }
    }
}


