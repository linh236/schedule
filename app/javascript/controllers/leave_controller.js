import { Controller } from "@hotwired/stimulus"
import moment from "moment/moment"
import RequestController from "./request_controller"

// Connects to data-controller="leave"
export default class extends RequestController {
  static targets = ["month", "leave"]

  connect() {
    this.setDataDefault();
  }

  setDataDefault() {
    this.monthTarget.value = moment().format("Y-M");
  }

  selectMonth(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    this.monthValue = event.target.value;
    console.log(this.monthValue)
  }

  detail(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    const id = event.target.dataset.id;
    this.sendGet({url: `/leaves/${id}`})
  }  

  selectStatus(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    this.status = event.target.value;
    this.monthValue = this.monthValue || this.monthTarget.value || this.month.value;
    this.sendGet({url: `/leaves?status=${this.status}&month_of_year=${this.monthValue}`})
  }

}
