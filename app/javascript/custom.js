


$(document).ready(function() {
   $("#search_place").hide();
});


$(document).on("change","#search_searchtype",function() {
   var searchtype = $("#search_searchtype").val();
   if(searchtype =="searchbyprice"){
      $("#search_price").show();
      $("#search_place").hide();
   }
   else if(searchtype =="searchbyplace"){
      $("#search_price").hide();
      $("#search_place").show();
   }
   else{

   }
});

