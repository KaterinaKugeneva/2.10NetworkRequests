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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension MainTableViewController {
    func fetchCourses() {
        //let urlString = "https://rickandmortyapi.com/api/character/?page=" + String(currentPage)
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
