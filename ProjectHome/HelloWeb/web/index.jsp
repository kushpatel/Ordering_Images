<%-- 
    Document   : index
    Created on : Mar 22, 2013, 2:34:20 PM
    Author     : acdr4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>jQuery UI Sortable - Display as grid</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
        <style>
            #sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
            #sortable li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 128px; height: 128px; font-weight: bold; font-size: 1em; text-align: left; }
            #transbox { background-color:#ffffff; color:#000; width:20px; border:1px solid black; opacity:0.4; filter:alpha(opacity=40); } 
            img {max-width:128px;max-height:128px;}
        </style>
        <script>

            var recordsObj = {primaryIdx:0, recordsArr:[
                    {id:0, order:0, isPrimary:false, cdsLevel:11, thumb:"http://deliver.odai.yale.edu/content/id/51bdfd56-0077-463d-b2ab-fd175bbac5b0/format/1",caption:"before treatment, IR Peca 904, recto, unframed"},
                    {id:1, order:1, isPrimary:false, cdsLevel:11, thumb:"http://deliver.odai.yale.edu/content/id/f415d546-7e60-4d04-ac33-8146e36bccd1/format/1",caption:"before treatment, recto, unframed, UV Fluorescence"},
                    {id:2, order:2, isPrimary:false, cdsLevel:11, thumb:"http://deliver.odai.yale.edu/content/id/5845bd26-b5e9-4757-9e5c-a7391e4aa178/format/1",caption:"before treatment, raking light, recto, unframed"},
                    {id:3, order:3, isPrimary:false, cdsLevel:11, thumb:"http://deliver.odai.yale.edu/content/id/4ae0ebe1-d9a0-45ac-aa66-b695360855e4/format/1",caption:"after treatment, cropped to image, recto, unframed"}
            ]};
    
            $(function() {
                $( "#sortable" ).sortable();
                $( "#sortable" ).disableSelection();
            });
    
            function showData(caption) {
                alert(caption);
            }

            function setPrimary(index)
            {
                recordsObj.recordsArr[recordsObj.primaryIdx].isPrimary = false;
                recordsObj.recordsArr[index].isPrimary = true;
                recordsObj.primaryIdx = index;
                //is_primary[primary_idx] = false;
                //is_primary[index] = true;
                alert(index);
            }

            function setCDSLevel(index)
            {
                recordsObj.recordsArr[index].cdsLevel = $('#cds_level'+index+'').val();
                displayRecordsObj("cdsLevel");
                //cds_level[index] = $('#cds_level'+index+'').val();
                //alert(cds_level);
            }
            
            function displayRecordsObj(param)
            {
                var temp = [];
                if(param == "id") {
                    for(i = 0; i < 4; i++){
                        temp.push(recordsObj.recordsArr[i].id);
                    }
                }
                else if(param == "order"){
                    for(i = 0; i < 4; i++){
                        temp.push(recordsObj.recordsArr[i].order);
                    }
                }
                else if(param == "isPrimary"){
                    for(i = 0; i < 4; i++){
                        temp.push(recordsObj.recordsArr[i].isPrimary);
                    }
                }
                else if(param == "cdsLevel"){
                    for(i = 0; i < 4; i++){
                        temp.push(recordsObj.recordsArr[i].cdsLevel);
                    }
                }
                alert(temp);
            }
    
        </script>
    </head>
    <body>

        <form id="getData" action="#">
            Search for an object: 
            <select>
                <option value="bibid">Orbis Bib ID</option>
                <option value="objectid">TMS Object ID</option>
            </select>
            # <input type="text" name="id"/> 
            <input type="button" value="Search"></input>
        </form>

        <form id="saveData" action="#">

            <ul id="sortable">
                <script>
                    if (recordsObj.recordsArr)
                    {
                        $('#sortable').append('<hr/>');
                        $.each(recordsObj.recordsArr, function(i) {
                            $('#sortable').append('<li class="ui-state-default"><div onClick="showData(\''+recordsObj.recordsArr[i].caption+'\');"><img alt="'+recordsObj.recordsArr[i].caption+'" src="'+recordsObj.recordsArr[i].thumb+'"></div><div><input id = "'+i+'" type="radio" name="primary" value="primary" onClick = setPrimary('+i+')>primary</div>CDS Level:<select id="cds_level'+i+'" onchange = setCDSLevel('+i+')><option value="11">11</option><option value="12">12</option></select></li>');
                        });
                    }
                    else
                        $('#sortable').append("<p>No data in Media Manager for this object!</p>");
                </script>
            </ul>

            <div style="clear: both; padding-top:20px;">
                <hr/>
                <input type="button" value="save"></input>
            </div>
        </form> 


        <h1>Entry Form</h1>
        <form name="Name Input Form" action="response.jsp"> 
            Enter your name:
            <input type="text" name="name" />
            <input type="submit" value="OK" />
        </form>
    
    
    </body>
</html>
