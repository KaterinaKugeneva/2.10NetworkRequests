//
//  MainTableViewController.swift
//  2.10NetworkRequests
//
//  Created by Ekaterina Kugeneva on 26.11.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var persons: [Person] = []
    private var info = WebInformation (Info.init("",""), results: [])
    private var currentPage = "https://rickandmortyapi.com/api/character/?page=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
        
    }
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        currentPage = info.info.next ?? "https://rickandmortyapi.com/api/character/?page=42"
        fetchCourses()
    }
    @IBAction func buttunBackpressed(_ sender: UIBarButtonItem) {
        currentPage = info.info.prev ?? "https://rickandmortyapi.com/api/character/?page=1"
        fetchCourses()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell
        let person = persons[indexPath.row]
        
        cell.configure(with: person)
        
        return cell
    }
    
    
}
extension MainTableViewController {
    func fetchCourses() {
        let urlString = currentPage
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.info = try JSONDecoder().decode(WebInformation.self, from: data)
                self.persons = self.info.results
                // print (self.persons)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)//.localizedDescription)
            }
            
        }.resume()
    }
}
