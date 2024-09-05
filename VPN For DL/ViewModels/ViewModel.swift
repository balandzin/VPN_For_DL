//
//  ViewModel.swift
//  VPN For DL
//
//  Created by Антон Баландин on 4.09.24.
//

import Foundation

protocol VPNViewModelDelegate: AnyObject {
    func didUpdateVPNConfig(_ config: VPNConfig)
}

final class ViewModel {
    weak var delegate: VPNViewModelDelegate?
    
    private var vpnConfig: VPNConfig {
        didSet {
            delegate?.didUpdateVPNConfig(vpnConfig)
        }
    }
    
    init() {
        self.vpnConfig = VPNConfig(ipAddress: "", isConnected: false)
    }
    
    func updateIPAddress(_ ipAddress: String) {
        vpnConfig.ipAddress = ipAddress
        saveIPToFile(ipAddress)
    }
    
    func toggleConnection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.vpnConfig.isConnected.toggle()
            if self.vpnConfig.isConnected {
                if let lastIP = self.loadIPFromFile() {
                    print("Last connected IP: \(lastIP)")
                }
            }
        }
    }
    
    private func saveIPToFile(_ ip: String) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/last_ip.txt"
        do {
            try ip.write(toFile: path, atomically: true, encoding: .utf8)
        } catch {
            print("Error saving IP: \(error)")
        }
    }
    
    private func loadIPFromFile() -> String? {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/last_ip.txt"
        do {
            let lastIP = try String(contentsOfFile: path, encoding: .utf8)
            return lastIP
        } catch {
            print("Error loading IP: \(error)")
            return nil
        }
    }
}
