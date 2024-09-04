//
//  ViewController.swift
//  VPN For DL
//
//  Created by Антон Баландин on 4.09.24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - GUI Variables
    private lazy var ipTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter an IP address"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.font = UIFont.preferredFont(forTextStyle: .footnote)
        return textField
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Statuses: Disabled"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Connect", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(connectButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Actions
    @objc private func connectButtonTapped() {
        print("Connect button tapped")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(ipTextField)
        view.addSubview(statusLabel)
        view.addSubview(connectButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        ipTextField.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        connectButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ipTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ipTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ipTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            connectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            connectButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            connectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
