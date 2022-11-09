// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"
import EventsController from "./events_controller";
// import EventModalController from "./event_modal_controller";
import AttendanceLogsController from "./attendance_logs_controller";
import HelperController from "./helper_controller";
import RequestController from "./request_controller";
import ApprovesController from "./approves_controller";

application.register("events", EventsController)
application.register("attendance-logs", AttendanceLogsController)
application.register("helper", HelperController)
application.register("request", RequestController)
application.register("approves", ApprovesController)
