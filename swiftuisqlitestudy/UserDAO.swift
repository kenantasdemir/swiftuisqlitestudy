//
//  UserDAO.swift
//  swiftuisqlitestudy
//
//  Created by kenan on 27.07.2024.
//

import Foundation

class UserDAO{
    let db:FMDatabase?
    
    
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let targetPath = URL(fileURLWithPath: dbPath).appendingPathComponent("users.sqlite")
        db = FMDatabase(path: targetPath.path)
    }
    
    func getAllUsers(){
        db?.open()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM userstable", values: nil)
            while result.next(){
                let user_id = Int(result.string(forColumn:"user_id"))
                let user_name = result.string(forColumn:"user_name")
                let user_phone = result.string(forColumn:"user_phone")
                
                print("-------------------")
                print("User ID: \(user_id!)")
                print("User Name: \(user_name!)")
                print("User Phone: \(user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func insertUser(user_name:String = "",user_phone:String = ""){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO userstable (user_name,user_phone) VALUES (?,?)",values:[user_name,user_phone])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    func updateUser(user_id:Int,user_name:String,user_phone:String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE userstable SET user_name = ?, user_phone = ? WHERE user_id = ?",values:[user_name,user_phone,user_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func removeUser(user_id:Int){
        do{
            try db?.executeUpdate("DELETE FROM userstable WHERER user_id = ?",values:[user_id])
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getUser(user_id:Int){
        db?.open()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM userstable WHERE user_id = ?", values: [user_id])
            while result.next(){
                let user_id = Int(result.string(forColumn:"user_id"))
                let user_name = result.string(forColumn:"user_name")
                let user_phone = result.string(forColumn:"user_phone")
                
                print("-------------------")
                print("User ID: \(user_id!)")
                print("User Name: \(user_name!)")
                print("User Phone: \(user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func searchUser(wordToBeSearched:String){
        db?.open()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM userstable WHERE user_ad LIKE ?", values: ["%\(wordToBeSearched)%"])
            while result.next(){
                let user_id = Int(result.string(forColumn:"user_id"))
                let user_name = result.string(forColumn:"user_name")
                let user_phone = result.string(forColumn:"user_phone")
                
                print("-------------------")
                print("User ID: \(user_id!)")
                print("User Name: \(user_name!)")
                print("User Phone: \(user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func getOneUserByRandom(){
        db?.open()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM userstable ORDER BY RANDOM() LIMIT 1", values: nil)
            while result.next(){
                let user_id = Int(result.string(forColumn:"user_id"))
                let user_name = result.string(forColumn:"user_name")
                let user_phone = result.string(forColumn:"user_phone")
                
                print("-------------------")
                print("User ID: \(user_id!)")
                print("User Name: \(user_name!)")
                print("User Phone: \(user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func checkRecord(user_name:String){
        db?.open()
        
        do{
            let result = try db!.executeQuery("SELECT COUNT(*) AS result FROM userstable WHERE user_name = ?",values:[user_name])
            while result.next(){
                print("-----------------")
                print("Result : \(result)")
            }
        }catch{
            
        }
        
        db?.close()
    }
    
}
