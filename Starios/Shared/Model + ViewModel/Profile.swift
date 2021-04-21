//
//  Profile.swift
//  Starios
//
//  Created by aaron on 2021/4/21.
//

import Foundation

// Model
struct Profile: Codable, Identifiable {
    var id: UUID
    var name: String
    var bio: String
}

// ViewModel
class ProfileData: ObservableObject {
    @Published var profiles: [Profile] = []
    
    //  Get URL of Sandbox
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let profilesURL = sandboxURL.appendingPathComponent("profiles.json")
    
    
    init() {
        profiles = getProfiles()
    }
    
    func getProfiles() -> [Profile] {
        var result: [Profile] = []
        if FileManager.default.fileExists(atPath:  profilesURL.path) {
            let data = try! Data(contentsOf:  profilesURL)
            result = try! JSONDecoder().decode([Profile].self, from: data)
        }
        return result
    }//get
    
    func saveProfiles() {
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.profiles)
            try? data?.write(to: self.profilesURL)
        }
    }//save with GCD
}
