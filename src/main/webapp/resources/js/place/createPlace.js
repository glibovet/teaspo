/**
 * Created by mykola.dekhtiarenko on 24.04.17.
 */
/**
 * Created by mykola.dekhtiarenko on 24.04.17.
 */

$(document).ready(function () {

    $('#submit').on('click', function () {
        $.ajax({
            headers: HEADERS,
            url: "/api/places/",
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
    place = {};
    place["name"]=$('#name').val();
    place["description"]=$('#description').val();
    place["shortlink"]=$('#shortlink').val();
    place["email"]=$('#email').val();
    place["phone"]=$('#phone').val();
    place["web"]=$('#web').val();
    place["contacts"]=$('#contacts').val();

    if(markers[0]!="default"){
        place["latitude"]= markers[0].getPosition().lat();
        place["longitude"]= markers[0].getPosition().lng();
    }
    alert(JSON.stringify(place));
    return JSON.stringify(place);
}



