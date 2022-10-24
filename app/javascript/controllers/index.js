// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"
import EventsController from "./events_controller";
// import EventModalController from "./event_modal_controller";
import AttendanceLogsController from "./attendance_logs_controller";

application.register("events", EventsController)
application.register("attendance-logs", AttendanceLogsController)
