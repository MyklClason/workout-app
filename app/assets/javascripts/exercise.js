function ready() {
  $('#workout-date').datepicker({ dateFormat: 'yy-mm-dd' });
};

// Make work with or without Turbolinks
$(document).ready(ready);
$(document).on('page:load', ready);