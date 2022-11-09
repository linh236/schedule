import RequestController from "./request_controller"
import moment from "moment/moment"

// Connects to data-controller="events"
export default class extends RequestController {
  static targets = ["event", "title", "reason", "calendarEvent"] 
  
  connect() {
    this.unSelectEvent();
  }

  addEvent({params: {url}}) {
    this.sendGet({url: url, method: "GET"})
  }

  leave(e) {
    // This is errror.
    this.titleTarget.innerHTML = "Application for leave" 
    this.reasonTarget.innerHTML = "Reason" 
    
    const isLeave = e.target.checked;
    e.target.value = "true";
    if (isLeave) {
      // this.outputTarget.innerHTML =  "Helo"
    }
  }


  dragStart(event) {
    event.target.style.opacity = "0.4"
    event.target.style.color = "white"
    event.target.style.background = "#575bfc00"
    this.dragSrcEl = event.target;
    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/html", event.target.innerHTML)
  }

  dragEnter(event) {
    event.target.classList.add("over");

    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }


  dragOver(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }

  dragLeave(event) {
    event.target.classList.remove("over");
    this.resetOpacity();
  }

  drop(event) {
    event.stopPropagation();
    event.target.classList.remove("over");
    this.resetOpacity();
    if (this.dragSrcEl.dataset.date) {
      this.sendPost({url: "/admin/update_date", method: "PUT", body: {
        "from": this.dragSrcEl.dataset.date,
        "to": event.target.dataset.date
      }})
    }

    if (this.dragSrcEl.dataset.id) {
      const id = this.dragSrcEl.dataset.id;
      const date = localStorage.getItem("date");
      this.sendPost({url: `/admin/events/${id}`, method: "PUT", body: {
        "date": date
      }})
    }
  }

  dragEnd(event) {
    this.resetOpacity();
  }

  resetOpacity() {
    this.eventTargets.forEach(element => {
      element.style.opacity = "1";
    });
    this.calendarEventTargets.forEach(element => {
      element.style.opacity = "1";
    });
  }

  selecteDateMoveEvent(event) { 
    if (event.preventDefault) {
      event.preventDefault();
    }
    if (event.target.dataset.date === localStorage.getItem("date")) {
      localStorage.clear();
    } else {
      this.selectedDateMoveEvent = event.target;
      localStorage.setItem("date", event.target.dataset.date);
    }

    this.unSelectEvent();
  }

  unSelectEvent() {
    const current = moment().format("Y-M-DD")

    this.calendarEventTargets.forEach(element => {
      if (element.dataset.date !== localStorage.getItem("date") && element.dataset.date !== current.toString()) {
        element.style.background = "#575bfc00";
      } else if (element.dataset.date === current.toString()) {
        element.style.background = "#ff59b600 !important";
      } else {
        element.style.background = "red";
      }
    });
  }

  disconnect() {
    localStorage.clear();
  }
}
