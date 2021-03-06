// Saves input from options page to localStorage
function save_data() {
  // Get the selected value of the currency dropdown
  var e = document.getElementById("currency");
  var value = e.options[e.selectedIndex].value;
  var status = document.getElementById("status");
  var optionsApplied = true;

  localStorage['currency'] = value.toUpperCase();

// If the save button is clicked, display a message
  if (optionsApplied) {
    $("#status").show().delay(3000).fadeOut();
  }
}

document.querySelector('#save').addEventListener('click', save_data);
