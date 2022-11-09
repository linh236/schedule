import { Controller } from "@hotwired/stimulus"
import RequestController from "./request_controller";
import moment from "moment/moment"

// Connects to data-controller="approves"
export default class extends RequestController {
  static targets = ["approve", "approveId", "note", "noteError", "btnCreate", "unSelectApprove", "month", "monthMobile"]

  connect() {
   this.setDataDefault();
  }

  setDataDefault() {
    this.monthTarget.value = moment().format("Y-M");
    this.monthMobileTarget.value = moment().format("Y-M");
    this.statusValue = "1";
  }

  dragStart(event) {
    event.target.style.opacity = "0.4"
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
    this.sendPost({url: "/admin/approves", method: "POST", body: {
      "from": this.dragSrcEl.dataset.id,
      "to": event.target.dataset.id,
      "position_from": this.dragSrcEl.dataset.position,
      "position_to": event.target.dataset.position,
      "month_of_year": this.monthValue,
      "status": this.status
    }})
  }

  dragEnd(event) {
    this.resetOpacity();
  }

  resetOpacity() {
    this.approveTargets.forEach(element => {
      element.style.opacity = "1";
    });
  }

  detail(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    localStorage.setItem("approve-id", event.target.dataset.id);
    this.sendGet({url: `/admin/approves/${event.target.dataset.id}`, method: "GET"});
  }

  approved(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    this.sendPost({url: `/admin/approves/${event.target.dataset.id}`, method: "PUT"})
  }

  disapprove(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    if (localStorage.getItem("approve-id") === null) {
      this.unSelectApproveTarget.innerHTML = "You must select leave application";
    } else {
      this.unSelectApproveTarget.innerHTML = "";
      this.approveIdTarget.value = localStorage.getItem("approve-id");
    }
    this.btnCreateTarget.disabled = true;
  }

  noteContent(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      if (event.target.value.length < 20) {
        this.btnCreateTarget.disabled = true;
        this.noteErrorTarget.innerHTML = `${event.target.value.length}/20`
      } else {
        this.btnCreateTarget.disabled = false;
      }
    }, 200)
  }

  selectStatus(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    this.status = event.target.value;
    this.monthValue = this.monthValue || this.monthTarget.value || this.month.value;
    this.sendGet({url: `/admin/approves?status=${this.status}&month_of_year=${this.monthValue}`})
  }

  selectMonth(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    this.monthValue = event.target.value;
    this.status = this.status || this.statusValue;
    this.sendGet({url: `/admin/approves?status=${this.status}&month_of_year=${this.monthValue}`})
  }
  
  disconnect() {
    localStorage.clear();
  }
}
