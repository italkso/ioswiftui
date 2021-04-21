//
//  MissionData.swift
//  Starios
//
//  Created by aaron on 2021/4/21.
//

import Foundation

// Model
struct MarsMission: Identifiable, Codable {
    var id: UUID
    var title: String
    var content: String
}

// ViewModel
class MissionData: ObservableObject {
    @Published var missions: [MarsMission] = []
    
    //  Get URL of Sandbox
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let missionsURL = sandboxURL.appendingPathComponent("missions.json")
    
    
    init() {
        missions = getMissions()
    }
    
    func getMissions() -> [MarsMission] {
        var result: [MarsMission] = []
        if FileManager.default.fileExists(atPath: missionsURL.path) {
            let data = try! Data(contentsOf: missionsURL)
            result = try! JSONDecoder().decode([MarsMission].self, from: data)
        }
        return result
    }//get
    
    func saveMissions() {
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.missions)
            try? data?.write(to: self.missionsURL)
        }
    }//save with GCD
}

