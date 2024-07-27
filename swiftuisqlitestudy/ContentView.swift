//
//  ContentView.swift
//  swiftuisqlitestudy
//
//  Created by kenan on 27.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("").onAppear{
                copyDatabase()
                let udao = UserDAO()
                udao.insertUser(user_name: "Kenan",user_phone: "132432")
                udao.getAllUsers()
            }
        }
        .padding()
    }
    
    func copyDatabase(){
        let bundle = Bundle.main.path(forResource: "users", ofType: ".sqlite")
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let targetPath = URL(fileURLWithPath: dbPath).appendingPathComponent("users.sqlite")
        let fm = FileManager.default
        
        if fm.fileExists(atPath: targetPath.path){
            print("DB already copied")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: targetPath.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
