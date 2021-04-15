//
//  TaskItem.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import Foundation
import CoreData

public class TaskItem: NSManagedObject, Identifiable{
    @NSManaged public var task: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var isMarked: Bool
}

extension TaskItem {
    static func getAllMemoItems() -> NSFetchRequest<TaskItem>{
        let request:  NSFetchRequest<TaskItem> = TaskItem.fetchRequest()  as! NSFetchRequest<TaskItem>
        let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
