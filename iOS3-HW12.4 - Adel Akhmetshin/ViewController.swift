//
//  ViewController.swift
//  iOS3-HW12.4 - Adel Akhmetshin
//
//  Created by Адель Ахметшин on 05.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var array = ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время", "Основные", "Пункт управления", "Экран и яркость", "Экран Домой", "Универсальный доступ", "Обои", "Siri и поиск", "Face ID и код-пароль"]
    
    override func viewDidLoad() {
        super.viewDidLoad() // Test
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
}

// MARK: - ViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = array[indexPath.row]
        print("В ячейке номер", indexPath.row, " - ", number) // Значение самой ячейки
        tableView.deselectRow(at: indexPath, animated: true) // Отмена выделения ячейки
    }
}

// MARK: - ViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 4
        case 2:
            return 15
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        let switchView = UISwitch(frame: .zero) // Экземпляр переключателя
        switchView.setOn(true, animated: true)
        
        if (indexPath.section == 0) {
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = array[0]
            cell.imageView?.image = UIImage(systemName: "airplane")
            cell.accessoryView = switchView
        case 1:
            cell.textLabel?.text = array[1]
            cell.imageView?.image = UIImage(systemName: "wifi")
            cell.detailTextLabel?.text = "Выкл."
            cell.accessoryType = .disclosureIndicator
        case 2:
            cell.textLabel?.text = array[2]
            cell.imageView?.image = UIImage(systemName: "wave.3.forward")
            cell.detailTextLabel?.text = "Вкл."
            cell.accessoryType = .disclosureIndicator
        case 3:
            cell.textLabel?.text = array[3]
            cell.imageView?.image = UIImage(systemName: "antenna.radiowaves.left.and.right")
            cell.detailTextLabel?.text = "Выкл."
            cell.accessoryType = .disclosureIndicator
        case 4:
            cell.textLabel?.text = array[4]
            cell.imageView?.image = UIImage(systemName: "personalhotspot")
            cell.detailTextLabel?.text = "Выкл."
            cell.accessoryType = .disclosureIndicator
        case 5:
            cell.alpha = 0
            cell.textLabel?.text = array[5]
            cell.imageView?.image = UIImage(systemName: "circle.grid.cross.fill")
            cell.accessoryType = .disclosureIndicator
        default:
            break
        }
        } else if (indexPath.section == 1) {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = array[5]
                cell.imageView?.image = UIImage(systemName: "circle.grid.cross.fill")
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell.textLabel?.text = array[6]
                cell.imageView?.image = UIImage(systemName: "speaker.wave.3.fill")
                cell.accessoryType = .disclosureIndicator
            case 2:
                cell.textLabel?.text = array[7]
                cell.imageView?.image = UIImage(systemName: "moon")
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.textLabel?.text = array[8]
                cell.imageView?.image = UIImage(systemName: "hourglass")
                cell.accessoryType = .disclosureIndicator
            default:
                break
            }
        } else if (indexPath.section == 2) {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = array[9]
                cell.imageView?.image = UIImage(systemName: "gear")
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell.textLabel?.text = array[10]
                cell.imageView?.image = UIImage(systemName: "bonjour")
                cell.accessoryType = .disclosureIndicator
            case 2:
                cell.textLabel?.text = array[11]
                cell.imageView?.image = UIImage(systemName: "textformat.size")
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.textLabel?.text = array[12]
                cell.imageView?.image = UIImage(systemName: "command")
                cell.accessoryType = .disclosureIndicator
            case 4:
                cell.textLabel?.text = array[13]
                cell.imageView?.image = UIImage(systemName: "figure.wave")
                cell.accessoryType = .disclosureIndicator
            case 5:
                cell.textLabel?.text = array[14]
                cell.imageView?.image = UIImage(systemName: "square.dashed")
                cell.accessoryType = .disclosureIndicator
            case 6:
                cell.textLabel?.text = array[15]
                cell.imageView?.image = UIImage(systemName: "waveform")
                cell.accessoryType = .disclosureIndicator
            case 7:
                cell.textLabel?.text = array[16]
                cell.imageView?.image = UIImage(systemName: "faceid")
                cell.accessoryType = .disclosureIndicator
            default:
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return " "
        case 1:
            return " "
        default:
            break
        }
        return " "
    }
}
// MARK: - UISearchResultsUpdating
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "nil")
    }
    
}
