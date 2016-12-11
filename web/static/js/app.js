// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import moment from "moment";

import $ from "jquery";
window.$ = $;

function readDistance() {
  return $("#run-distance-raw-value").val();
}

function _readDatePart(formGroup, fieldName, datePart) {
  return formGroup.find(`select[name='run[${fieldName}][${datePart}]']`).val();
}

function _readDate(formGroup, fieldName) {
  const __read = datePart => _readDatePart(formGroup, fieldName, datePart);
  return new Date(
    __read('year'),
    __read('month'),
    __read('day'),
    __read('hour'),
    __read('minute'),
    __read('second')
  );
}

const readStartDate = () => _readDate(
	$(".form-group").first(),
	"start_time"
);

const readEndDate = () => _readDate(
  $(".form-group").eq(1),
  "end_time"
);

function setRoughElapsedTime() {
  const startDate = readStartDate();
  const endDate = readEndDate();
  const duration = moment.duration(endDate - startDate);

  const durStr = duration.asSeconds() === 0
    ? "0 seconds"
    : `roughly ${duration.humanize()}`;

  $("#run-elapsed-time").text(durStr);
}

function setAverageSpeed() {
  const hours = moment.duration(readEndDate() - readStartDate()).asHours();
  const distance = Number(readDistance());
  const speed = hours === 0
    ? 0
    : distance / hours;

  $("#run-average-speed").text(speed.toFixed(2));
}

function setDistanceUnit() {
  const unit = $("#run_distance_unit").val();
  $(".run-distance-unit").first().text(unit);
}

function updateSummary() {
  setRoughElapsedTime();
  setAverageSpeed();
  setDistanceUnit();
}

function registerChangeHandlers() {
  // This is a little heavy-handed, but this code probably won't really last
  // that long anyway...
  $("select").each(function () {
    $(this).change(updateSummary);
  });
  $("input").each(function() {
    $(this).keyup(updateSummary);
  });
}

$(document).ready(function() {
  updateSummary();
  registerChangeHandlers();
});
