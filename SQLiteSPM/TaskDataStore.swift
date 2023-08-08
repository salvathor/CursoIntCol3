//
//  TaskDataStore.swift
//  SQLiteSPM
//
//  Created by Salvador Lopez on 04/08/23.
//

import Foundation
import SQLite

class TaskDataStore{
    
    //Nombre del directorio
    static let DIR_TASK_DB = "taskdb"
    
    //Nombre BD File
    static let STORE_DB_NAME = "task.sqlite3"
    
    //Scheme Type
    private let tasks = Table("Tasks")
    
    //Columnas de la tabla
    private let id = Expression<Int64>("id")
    private let taskName = Expression<String>("name")
    private let date = Expression<Date>("date")
    private let status = Expression<Bool>("status")
    
    //Singleton
    static let shared = TaskDataStore()
    
    //Conexion a la base de datos SQLite
    private var db: Connection? = nil
    
    private init(){
        // Obtener directorio
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(TaskDataStore.DIR_TASK_DB)
            do{
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true)
                let dbPath = dirPath.appendingPathComponent(TaskDataStore.STORE_DB_NAME).path
                // Realizar Conexion
                db = try Connection(dbPath)
                createTable()
                print("SQLite sucessfully created: \(dbPath)")
            }catch{
                print("Error: \(error)")
            }
        }
    }
    
    private func createTable(){
        guard let database = db else{
            return
        }
        do{
            // Creacion de la tabla
            try database.run(tasks.create {
                table in
                table.column(id, primaryKey: .autoincrement)
                table.column(taskName)
                table.column(date)
                table.column(status)
            })
            print("Table created...")
        }catch{
            print("Error: \(error)")
        }
    }
    
    func getAllTasks() -> [Task] {
        var tasks: [Task] = []
        
        guard let database = db else{
            return []
        }
        
        do{
            for task in try database.prepare(self.tasks){
                tasks.append(Task(id: task[id], name: task[taskName], date: task[date], status: task[status]))
            }
        }catch{
            print("Error: \(error)")
        }
        return tasks
    }
    
    func insertTask(name: String, date: Date) -> Int64? {
        guard let database = db else{
            return nil
        }
        
        let insert = tasks.insert(
            self.taskName <- name,
            self.date <- date,
            self.status <- false
        )
        
        dump(insert)
        
        do{
            let rowId = try database.run(insert)
            return rowId
        }catch{
            print("Error: \(error)")
            return nil
        }
        
    }
    
    func runBatch(){
        guard let database = db else{
            return
        }
        do{
            for index in 0...9{
                try database.run("INSERT INTO Tasks (name,date,status) VALUES (?,?,?)","Tarea \(index)","2023-08-09T13:00:00.000",0)
            }
        }catch{
            print("Error: \(error)")
        }
    }
    
    func completeStatement() throws {
        guard let database = db else{
            return
        }
        let stmt = try database.prepare("SELECT id, name from Tasks")
        for row in stmt {
            for (index, name) in stmt.columnNames.enumerated(){
                print("\(name):\(row[index]!)")
            }
        }
    }
    
}
