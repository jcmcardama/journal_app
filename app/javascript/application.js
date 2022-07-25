//= require jquery3
//= require popper
//= require bootstrap-sprockets

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

function checkTime(i){
    if (i < 10){
        i = "0" + i;
    }
    return i;
}

(function () {
    function checkTime(i) {
        return (i < 10) ? "0" + i : i;
    }

    function startTime() {
        var today = new Date(),
            y = checkTime(today.getFullYear()),
            mo = checkTime(today.getMonth() + 1),
            d = checkTime(today.getDate()),
            h = checkTime(today.getHours()),
            m = checkTime(today.getMinutes()),
            s = checkTime(today.getSeconds());
        var amPm = 'AM';
        if(h > 12){
            amPm = 'PM';
            h = h - 12;
        }
        document.getElementById('time').innerHTML = mo + "/" + d + "/" + y + " and the time is " + h + ":" + m + ":" + s + ' ' + amPm;
        t = setTimeout(function () {
            startTime()
        }, 500);
    }
    startTime();
})();