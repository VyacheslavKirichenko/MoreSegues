//
//  ContactsListViewController.swift
//  MoreSegues
//
//  Created by mac on 5/10/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    var contacts: [Contact] = [
        Contact(image: nil, name: "John", phone: "(888) 555 5512"),
        Contact(image: nil, name: "Kate", phone: "(888) 123 5412")
    ]
    var contact: Contact?
    var selectedItem = 0
    var myContact: Contact = Contact(image: nil, name: "Irina", phone: "(111) 333 1234")
    
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: sender)
        
    }
    
    
    @IBAction func popAction(_ sender: Any) {
        performSegue(withIdentifier: "toPopover", sender: sender)
    }
    
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
    tableView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    @IBOutlet weak var tableView: UITableView?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let selectedPath = tableView?.indexPathForSelectedRow else { return }
//        if let target = segue.destination as? DetailContactViewController {
//            target.contact = contacts[selectedPath.row]
//        } else
        if segue.identifier == "toDetail" {
            if let detailViewController = segue.destination as? DetailContactViewController {
                detailViewController.contact = contacts[selectedItem]
                
            }
        }
        
        
            if segue.identifier == "toPopover" {
            if let detailVievController = segue.destination as? DetailContactViewController{
                detailVievController.contact = myContact
                if let popover = detailVievController.popoverPresentationController {
                    popover.delegate = self
                }
            }
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
