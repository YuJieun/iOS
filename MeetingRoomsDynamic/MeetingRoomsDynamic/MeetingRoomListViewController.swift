//
//  MeetingRoomListViewController.swift
//  MeetingRoomsDynamic
//
//  Created by 유지은 on 2020/03/30.
//  Copyright © 2020 jieun. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {
    
    var meetingRooms: [String:[String:Int]] =
        ["Meeting":["Banksy":4,
          "Rivera":8,
          "Kahlo":8,
          "Picasso":10],
         "Seminar":[
          "Cezanne":20,
          "Matisse":30,
          "Renoir":40]] //이건 테이블뷰테 표시할 우리의 데이터 모델!
    
    func meetingRoomsAtIndex(index: Int) -> (key: String, value: [String:Int]){ //튜플을 리턴
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetingRooms[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count //몇개의 섹션
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //1.
        //let categoryValues = Array(meetingRooms.values)[section]
        
        //2.
        let rowCount = meetingRoomsAtIndex(index: section).value.count //value의 개수
        //질문 ? : let rowCount = meetingRoomsAtIndex(index: section).1.count 도 가능???

        
        return rowCount //몇개의 row인지
    }

    
   //각각의 cell을 어떻게 구성할것인가
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) //스토리보드에서 cell이름을 MyCell로 줌

        //let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})

        //let categoryValue = Array(meetingRooms.values)[indexPath.section]
        let categoryValue = meetingRoomsAtIndex(index: indexPath.section).value
        let orderedCategoryValue = categoryValue.sorted(by: {$0.1 < $1.1})
        //let roomName = Array(categoryValue.keys)[indexPath.row]
        //let capacity = Array(categoryValue.values)[indexPath.row]
        let roomName = orderedCategoryValue[indexPath.row].0
        let capacity = orderedCategoryValue[indexPath.row].1
        
        cell.textLabel!.text = roomName
        cell.detailTextLabel!.text = "\(capacity)"
        
        /*let roomNames = Array(meetingRooms.keys)
        let roomName = roomNames[indexPath.row]
        cell.textLabel!.text = roomName
        if let capacity:Int = meetingRooms[roomName]{
            cell.detailTextLabel!.text = "\(capacity)"
        }*/

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return meetingRoomsAtIndex(index: section).key
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
        let rowCount =  meetingRoomsAtIndex(index: section).value.count
       return "\(rowCount) rooms"
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
