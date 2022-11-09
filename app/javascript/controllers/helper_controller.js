import { Controller } from "@hotwired/stimulus"
import moment from "moment/moment"
// Connects to data-controller="helper"
export default class extends Controller {
  static targets = ["currenttime"]
  connect() {
    this._time = setInterval(() => {
      this.currenttimeTarget.innerHTML = this._getTime();
    }, 1000);
  }

  _getTime() {
    return moment().format('Y-M-D HH:mm:ss');
  }

  stopTimer() {
    const timer = this._timer;

    if (!timer) return;

    clearInterval(timer);
  }

  disconnect() {
    this.stopTimer();
  }


}
