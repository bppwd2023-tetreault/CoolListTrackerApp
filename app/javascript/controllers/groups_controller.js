import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "group", "user" ]
  manageUser(event) { // this will run when the user clicks on a checkbox
    const group = this.groupTarget
    const groupID = group.value
    const user = event.target
    const userID = event.target.id
    console.log(userID);
    console.log(event);
    //console.log("Hello, Stimulus!", this.element);
    $.ajax({
      url: "/groups/manage_group_users", 
      type: "get", 
      data: {theGroup: groupID, isChecked: user.checked, uID: userID},

      success: function(data) {
        console.log("Success")
      },
      error: function(data) {
        console.log("Failed")
      }
    });
  }
}