
$(document).ready(function() {


    $("#submitbutton").click(function() {
        this.submit();



    });

   $(".pricediv").slideDown(100);

   $("#searchtype").on('change',function(){
      var searchtype = $("#searchtype").val();

      if(searchtype =="searchbyprice"){
         $(".locationdiv").slideUp(100);
         $(".pricediv").slideDown(100);
      }
      else if(searchtype =="searchbyplace"){

         $(".pricediv").slideUp(100);
         $(".locationdiv").slideDown(100);
      }
      else{
         $(".locationdiv").slideUp(100);
         $(".pricediv").slideUp(100);
      }
   });

    $("#noofpersons").on('change',function(){

        var noofpersons = $("#noofpersons").val();
        var one = ["0€ to 25€", "25€ to 50€", "50€ to 75€", "75€ to 100€"];
        var two = ["0€ to 50€", "50€ to 100€", "100€ to 150€", "150€ to 200€"];
        var three = ["0€ to 75€", "75€ to 150€", "150€ to 225€", "225€ to 300€"];
        var four = ["0€ to 100€", "100€ to 200€", "200€ to 300€", "300€ to 400€"];
        var five = ["0€ to 125€", "125€ to 250€", "250€ to 375€", "375€ to 400€"];
        var six = ["0€ to 150€", "150€ to 300€", "300€ to 450€", "450€ to 600€"];
        var seven = ["0€ to 175€", "175€ to 350€", "350€ to 525€", "525€ to 700€"];
        var eight = ["0€ to 200€", "200€ to 400€", "400€ to 600€", "600€ to 800€"];
        var nine = ["0€ to 225€", "225€ to 450€", "450€ to 675€", "675€ to 900€"];
        var ten = ["0€ to 250€", "250€ to 500€", "500€ to 750€", "750€ to 1000€"];
        var eleven = ["0€ to 275€", "275€ to 550€", "550€ to 825€", "825€ to 1100€"];
        var twelve = ["0€ to 300€", "300€ to 600€", "600€ to 900€", "900€ to 1200€"];

        document.getElementById('price').options.length = 0;

        if (noofpersons == "1") {
            for (var i = 0; i < one.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = one[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "2") {

            for (var i = 0; i < two.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = two[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "3") {
            for (var i = 0; i < three.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = three[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "4") {
            for (var i = 0; i < four.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = four[i];
                document.getElementById('price').add(option);
            }
        }

        else if (noofpersons == "5") {
            for (var i = 0; i < five.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = five[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "6") {
            for (var i = 0; i < six.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = six[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "7") {
            for (var i = 0; i < seven.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = seven[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "8") {
            for (var i = 0; i < eight.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = eight[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "9") {
            for (var i = 0; i < nine.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = nine[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "10") {
            for (var i = 0; i < ten.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = ten[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "11") {
            for (var i = 0; i < eleven.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = eleven[i];
                document.getElementById('price').add(option);
            }
        }
        else if (noofpersons == "12") {
            for (var i = 0; i < twelve.length; i++) {
                var option = document.createElement('option');
                option.value = i+1;
                option.innerHTML = twelve[i];
                document.getElementById('price').add(option);
            }
        }

    });



});




