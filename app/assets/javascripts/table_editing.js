function buildObject(line) {
  var begin_time = line.querySelector('#playline_begin_time').value;
  var contact = line.querySelector('#playline_contact').value;
  var phone_number = line.querySelector('#playline_phone_number').value;
  var location = line.querySelector('#playline_location').value;
  var content = line.querySelector('#playline_content').value;
  return {
      begin_time: begin_time,
      contact: contact,
      phone_number: phone_number,
      location: location,
      content: content,
      credentials: 'same-origin'
    };
};

function fetchData(id, body, line, callback) {
  fetch(`/playlines/${id}`, {
    method: "PATCH",
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  })
  .then(function(response) {
    return response.json()
  })
  .then(function(data) {
    callback(data, line)
  });
};


function appendRow(data, line) {
  var id = data.id.toString();
  console.log(line);
  line.outerHTML = "<tr draggable='true' id='playline-id[" + id + "]' data-time='" + data.numeric_time + "' data-id='" + id + "'><td>" + data.begin_time + "</td><td>" + data.contact + "</td><td>" + data.phone_number + "</td><td>" + data.location + "</td> <td>" + data.content + "</td> <td class='playline-changes'><a data-confirm='Sure?'' data-remote='true' rel='nofollow' data-method='delete' href='/playlines/" + id + "'> <i class='fa fa-trash-o' aria-hidden='true'></i></a><a data-remote='true' href='/playlines/" + id + "/edit'> <i class='fa fa-pencil' aria-hidden='true'></i></a></td></tr>";
  console.log("hoi");
}
