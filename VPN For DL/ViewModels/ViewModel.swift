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
    }
    
    func toggleConnection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.vpnConfig.isConnected.toggle()
        }
    }
}
