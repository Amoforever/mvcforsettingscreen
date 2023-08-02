//
//  ViewController.swift
//  mvcforsettingscreen
//
//  Created by Amahastla on 02.08.2023.
//

import UIKit

class OnboardingControllerForSettingScreen: UIViewController {
    
    private var model = OnboardingModelOfSettingScreen.allModelsOnSettingScreen
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: view.frame,
            style: .insetGrouped
        )
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .singleLine
        // тут тоже через статичное свойство
        tableView.register(OnboardingTableCellonViewForSettingScreen.self,
                           forCellReuseIdentifier: OnboardingTableCellonViewForSettingScreen.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Настройки"
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extensions

extension OnboardingControllerForSettingScreen: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OnboardingTableCellonViewForSettingScreen.identifier, for: indexPath) as? OnboardingTableCellonViewForSettingScreen else {
            return UITableViewCell()
        }
        
        cell.model = model[indexPath.section][indexPath.row]
        return cell
        
    }
}

extension OnboardingControllerForSettingScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 && indexPath.row == 11 {
            return 60
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // чтобы ячейка отжималась
        
        print("Нажата ячейка \(model[indexPath.section][indexPath.row].title)")
        
        if indexPath.section == 0 && ( indexPath.row == 0 || indexPath.row == 5 ) {
        } else {
            let viewController = OnboardingDetailViewOfSettingScreen()
            viewController.model = model[indexPath.section][indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

