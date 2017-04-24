/**
 * Created by mykola.dekhtiarenko on 24.04.17.
 */

$(document).ready(function () {
   $('#submit').on('click', function () {
       $.ajax({
           headers: HEADERS,
           url: "/api/meetings/",
           type: "PUT",
           data: processData(),
           contentType: "application/json",
           dataType: "json",
           success: function(data) {
               alert();
               window.location.href="/";
           },
           error: function (request, status, error) {
               alert(request.responseText);
           }
       });

       return false;
   });


});

function processData() {
    meeting = {};
    meeting["subject"]=$('#subject').val();
    meeting["name"]=$('#name').val();
    meeting["description"]=$('#description').val();
    meeting["datetime"]=$('#datetime').val();
    meeting["capacity"]=$('#capacity').val();
    meeting["type"]=$('#type').val();
    if(markers[0]!="default"){
        meeting["latitude"]= markers[0].getPosition().lat();
        meeting["longitude"]= markers[0].getPosition().lng();
    }
    console.log(JSON.stringify(meeting));
    return JSON.stringify(meeting);
}



