
//----------------------------------------------------------------------------------------------------

    var SettingObj = {
        postUrl:"/Admin/Product/getProduct_AutoComplete",
        params: {},
        searchResultCanId: "divSearchResult",
        txtItemClass: "txtItemAutoComplete",
        trActiveClass: "trActive",
        searchWordParamName: "searchWord",
        tableSearchResultId: "tbl_searchResult",
        btnSearchId:""
    };
    function initAutoComplete(postUrl, txtItemClass,searchResultCanId,trActiveClass,searchWordParamName,tableSearchResultId)
    {
        SettingObj.postUrl = postUrl || "/Admin/Product/getProduct_AutoComplete";
        SettingObj.searchResultCanId = searchResultCanId || "divSearchResult";
        SettingObj.txtItemClass = txtItemClass || "txtItemAutoComplete";
        SettingObj.trActiveClass = trActiveClass || "trActive";
        SettingObj.searchWordParamName = searchWordParamName || "searchWord";
        SettingObj.tableSearchResultId = tableSearchResultId || "tbl_searchResult";

    }
    //----------------------------------------------------------------------------------------------------
    var txtInput=null;

    $(function () {






        var txtItemId = "";
        //----------------------------------------------------------------------------------------------------

        $(document).on('click', ('#' + SettingObj.tableSearchResultId + '  tr'), function (e) {
             //txtInput = $('.' + SettingObj.txtItemClass);
            var tr = $(this); //('#' + SettingObj.tableSearchResultId + '  tr');
            var code = tr.find("td").eq(0).text();

            var key = tr.find("td").eq(1).attr("id");

            var name = tr.find("td").eq(1).text();


            //  $("#" + txtItemId).val(name);
            //  $("#" + txtItemId).attr("lang", code);

            txtInput.val(name);
            txtInput.attr("lang", code);
            txtInput.attr("name", key);

            $("#" + SettingObj.searchResultCanId).hide();

            txtInput.trigger('click', [code, name]);


        })
        //----------------------------------------------------------------------------------------------------
        function PlaceSearchResult() {
            // txtInput = $('.' + SettingObj.txtItemClass);
            var position = txtInput.offset();
             
            //var position = $(this).position();
            var w_txt = txtInput.width();
            var h_txt = txtInput.outerHeight(true);

            var w_SearchCan = $("#" + SettingObj.tableSearchResultId).width();
            var h_SearchCan = $("#" + SettingObj.tableSearchResultId).outerHeight(true);


            $("#" + SettingObj.searchResultCanId).css({ 'left': position.left - w_SearchCan + w_txt, 'top': position.top + h_txt });

            //$("#divNote").html(position.top + "," + position.left + "," + w_txt + "," + h_txt + "," + w_SearchCan + "," + h_SearchCan);

        }

        //----------------------------------------------------------------------------------------------------


        $(document).on('focus', '.' + SettingObj.txtItemClass, function (e) {
            //console.log(1);
           // $("input[type='text']").removeClass("txtItemAutoComplete");
           // $(this).addClass("txtItemAutoComplete");
            txtInput = $(this);


        })
        //----------------------------------------------------------------------------------------------------

        //----------------------------------------------------------------------------------------------------

        //
        $(document).on("keyup",'.' + SettingObj.txtItemClass, function (e) {

           // alert(1);
          //  e.preventDefault();
             txtInput = $(this);
           // console.log(SettingObj.txtItemClass);
            var tbl = $('#' + SettingObj.tableSearchResultId);
            var activeTr;
            if (e.which == 40 || e.which == 38) {


                var n = tbl.find('.trActive').length;

                if (n == 0) {

                    var h = tbl.find('.trHead').length;

                    if (h == 0)
                        $('#' + SettingObj.tableSearchResultId + '  tr').eq(0).addClass('trActive');
                    else
                        $('#' + SettingObj.tableSearchResultId + '  tr').eq(1).addClass('trActive');





                }
                else {
                    activeTr = $('#' + SettingObj.tableSearchResultId).find('.trActive').first();
                    $('#' + SettingObj.tableSearchResultId + '  tr').removeClass('trActive');

                    if (e.which == 40) {
                        activeTr.next().addClass('trActive');
                    }
                    else if (e.which == 38) {
                        activeTr.prev().addClass('trActive');
                    }
                    //var name = activeTr.find("td").eq(1).text();
                    //$(this).val(name);

                }

                var name = activeTr.find("td").eq(1).text();
                $(this).val(name);


                return;
            }
            if (e.which == 13) {

                e.preventDefault();
                var activeTr = $('#' + SettingObj.tableSearchResultId).find('.trActive').first();

                var code = activeTr.find("td").eq(0).text();
                var name = activeTr.find("td").eq(1).text();


                // $(this).val(name);




                txtInput.attr("lang", code);
                $("#" + SettingObj.searchResultCanId).hide();



                $('#' + SettingObj.btnSearchId).trigger('click');


                return false;
            }


            $("#" + SettingObj.searchResultCanId).show();
            var searchWord = txtInput.val();
           
            //********************************************************************************

            if ($("#" + SettingObj.searchResultCanId).length == 0) {
                $('body').append("<div id='" + SettingObj.searchResultCanId + "'></div>");



            }


            $.get(SettingObj.postUrl + "?searchWord=" + searchWord, SettingObj.params, function (msg) {




                if (msg == "empty") {
                    $("#" + SettingObj.searchResultCanId).hide();
                }
                else {
                    $("#" + SettingObj.searchResultCanId).html(msg);
                    $("#" + SettingObj.searchResultCanId).show();
                }

                PlaceSearchResult();


            }

             , "html");


            //********************************************************************************
            //            $.ajax({
            //                type: "POST",
            //                url: SettingObj.postUrl,
            //                data: "{" + SettingObj.searchWordParamName + ":'" + searchWord + "'}",
            //                contentType: "application/json; charset=utf-8",
            //                dataType: "json",
            //                success: function (msg) {

            //                  
            //                    // Replace the div's content with the page method's return.

            //                    if (msg.d == "empty") {
            //                        $("#" + SettingObj.searchResultCanId).hide();
            //                    }
            //                    else {
            //                        $("#" + SettingObj.searchResultCanId).html(msg.d);
            //                        $("#" + SettingObj.searchResultCanId).show();
            //                    }

            //                }
            //            });
            //********************************************************************************




        })
        //----------------------------------------------------------------------------------------------------


    })
        
    function autoCompleteSearchKeyUp(obj,e) {


        SettingObj.postUrl= $(obj).attr("data-act");


            var tbl = $('#' + SettingObj.tableSearchResultId);
            var activeTr;
            if (e.which == 40 || e.which == 38) {


                var n = tbl.find('.trActive').length;

                if (n == 0) {

                    var h = tbl.find('.trHead').length;

                    if (h == 0)
                        $('#' + SettingObj.tableSearchResultId + '  tr').eq(0).addClass('trActive');
                    else
                        $('#' + SettingObj.tableSearchResultId + '  tr').eq(1).addClass('trActive');





                }
                else {
                    activeTr = $('#' + SettingObj.tableSearchResultId).find('.trActive').first();
                    $('#' + SettingObj.tableSearchResultId + '  tr').removeClass('trActive');

                    if (e.which == 40) {
                        activeTr.next().addClass('trActive');
                    }
                    else if (e.which == 38) {
                        activeTr.prev().addClass('trActive');
                    }
                    //var name = activeTr.find("td").eq(1).text();
                    //$(this).val(name);

                }

                var name = activeTr.find("td").eq(1).text();
                $(this).val(name);


                return;
            }
            if (e.which == 13) {

                e.preventDefault();
                var activeTr = $('#' + SettingObj.tableSearchResultId).find('.trActive').first();

                var code = activeTr.find("td").eq(0).text();
                var name = activeTr.find("td").eq(1).text();


                // $(this).val(name);




                $(this).attr("lang", code);
                $("#" + SettingObj.searchResultCanId).hide();



                $('#' + SettingObj.btnSearchId).trigger('click');


                return false;
            }


            $("#" + SettingObj.searchResultCanId).show();
            var searchWord = $(this).val();
           // txtInput = $(this);
            //********************************************************************************

            if ($("#" + SettingObj.searchResultCanId).length == 0) {
                $('body').append("<div id='" + SettingObj.searchResultCanId + "'></div>");



            }


            $.get(SettingObj.postUrl + "?searchWord=" + searchWord, SettingObj.params, function (msg) {




                if (msg == "empty") {
                    $("#" + SettingObj.searchResultCanId).hide();
                }
                else {
                    $("#" + SettingObj.searchResultCanId).html(msg);
                    $("#" + SettingObj.searchResultCanId).show();
                }

                PlaceSearchResult();


            }

             , "html");

         


      


    }
      