/**
 * Created by mykola.dekhtiarenko on 24.04.17.
 */

$(document).ready(function () {
   $('#submit').on('click', function () {
       proccesData();
   })
});

function proccesData() {
    meeting = {};
    meeting["subject"]=$('#subject').val();
    meeting["name"]=$('#name').val();
    meeting["description"]=$('#description').val();
    meeting["datetime"]=$('#datetimepicker1').val();
    meeting["capacity"]=$('#capacity').val();
    alert(markers[0]);

}

