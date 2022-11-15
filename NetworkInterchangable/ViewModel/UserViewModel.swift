//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Fatih Filizol on 15.11.2022.
//

import Foundation


class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel] ()
    
    //let webService = WebService()
    private var service : NetworkService
    init(service:NetworkService){
        self.service = service
    }
    
    var resource = ""
    
    func downloadUsers () async{
        if service.type == "WebService"{
            resource = Constanst.Urls.userExtension
        }else{
            resource = Constanst.Paths.baseUrl
        }
        
        do{
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error)
        }
        
    }
    
}


struct UserViewModel {
    
    
    let user : User
    
    
    var id: Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
}
