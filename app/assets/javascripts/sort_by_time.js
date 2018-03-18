function saveOrder(lines) {
  count = 1
  var idsAndCounts = {}
  for (i = 0; i < (lines.length); i ++) {
    var line = lines[i]
    var id = line.getAttribute('data-id')
    idsAndCounts[id] = count
    // Create object of id and count as value
    // Send single object, iterate over it in controller and save order number per id on each playline
    // This will result in a single request regardless of the amount of playlines.
    count ++;
  }
  fetch("/playlines/set_order", {
    method: "PATCH",
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      new_order: idsAndCounts,
      credentials: 'same-origin'
    })
  });
}

function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("playlines");
  switching = true;
  /* Make a loop that will continue until
  no switching has been done: */
  while (switching) {
    // Start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("tr");
    /* Loop through all table rows (except the
    first, which contains table headers): */
    for (i = 0; i < (rows.length - 1); i++) {
      // Start by saying there should be no switching:
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = parseFloat(rows[i].getAttribute('data-time'));
      y = parseFloat(rows[i + 1].getAttribute('data-time'));
      // Check if the two rows should switch place:
      if (x > y) {
        // I so, mark as a switch and break the loop:
        shouldSwitch= true;
        break;
      }
    }
    if (shouldSwitch) {
      /* If a switch has been marked, make the switch
      and mark that a switch has been done: */
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
  saveOrder(rows);
}


