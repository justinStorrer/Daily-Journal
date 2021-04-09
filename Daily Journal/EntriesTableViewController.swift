//
//  EntriesTableViewController.swift
//  Daily Journal
//
//  Created by Justin Storrer on 4/2/21.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let request: NSFetchRequest<Entry> = Entry.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            
            if let entriesFromCoreData = try? context.fetch(request) as? [Entry] {
                entries = entriesFromCoreData
                tableView.reloadData()
            }
        }
    }
    
    // How many rows?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    // What goes in each row?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? EntryTableViewCell {
            
            let entry = entries[indexPath.row]
            
            cell.entryTextLabel.text = entry.text
            cell.monthLabel.text = entry.month()
            cell.dayLabel.text = entry.day()
            
            return cell
            
        } else {
            
            return UITableViewCell()
            
        }
    }
    
    // When the row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        performSegue(withIdentifier: "segueToEntry", sender: entry)
    }
    
    // prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryVC = segue.destination as? EntryViewController {
            if let entryToBeSent = sender as? Entry {
                entryVC.entry = entryToBeSent
            }
        }
    }
    
    // Height of each cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

