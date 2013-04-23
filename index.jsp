<!doctype html>
 
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>jQuery UI Sortable - Display as grid</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <style>
    #sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
    #sortable li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 128px; height: 128px; font-weight: bold; font-size: 1em; text-align: left; }
    #transbox { background-color:#ffffff; color:#000; width="20px" border:1px solid black; opacity:0.4; filter:alpha(opacity=40); } 
    img {max-width:128px;max-height:128px;}
    </style>


<script>

    var is_primary = [false,false,false,false];
    var primary_idx = 0;
    var cds_level = [11,11,11,11];
    var old_position = [0,1,2,3];
    var new_position = [0,1,2,3];

    var data = [
    	{thumb:"http://deliver.odai.yale.edu/content/id/51bdfd56-0077-463d-b2ab-fd175bbac5b0/format/1",caption:"before treatment, IR Peca 904, recto, unframed"},
    	{thumb:"http://deliver.odai.yale.edu/content/id/f415d546-7e60-4d04-ac33-8146e36bccd1/format/1",caption:"before treatment, recto, unframed, UV Fluorescence"},
    	{thumb:"http://deliver.odai.yale.edu/content/id/5845bd26-b5e9-4757-9e5c-a7391e4aa178/format/1",caption:"before treatment, raking light, recto, unframed"},
		{thumb:"http://deliver.odai.yale.edu/content/id/4ae0ebe1-d9a0-45ac-aa66-b695360855e4/format/1",caption:"after treatment, cropped to image, recto, unframed"}
    ];
    
    $(function() {
        $('#sortable').sortable({
            start: function(e, ui) {
            // puts the old positions into array before sorting
            old_position = $(this).sortable('toArray');
            },
            update: function(event, ui) {
            // grabs the new positions now that we've finished sorting
            new_position = $(this).sortable('toArray');
            }
        });
        $( "#sortable" ).disableSelection();
    });
    
    function showData(caption) {
    	alert(caption);
    }

    /* set a given element as primary in the is_primary array */
    function setPrimary(index)
    {
        is_primary[primary_idx] = false;
        is_primary[index] = true;
        alert(index);
        alert(old_position);
        alert(new_position);
    }

    /* sets the CDS level of a given element in the cds_levl array to the new value specified in drop down menu */
    function setCDSLevel(index)
    {
        cds_level[index] = $('#cds_level'+index+'').val();
        alert(cds_level);
    }

    /* executed onload of the page. Appends the list of images as a list to #sortable element specified on html */
    $(document).ready(function () {
        if (data)
        {
            $.each(data, function(i) {
                $('#sortable').append('<li class="ui-state-default" id = "'+i+'"><div onClick="showData(\''+data[i].caption+'\');"><img alt="'+data[i].caption+'" src="'+data[i].thumb+'"></div><div><input id = "'+i+'" type="radio" name="primary" value="primary" onClick = setPrimary('+i+')>primary</div>CDS Level:<select id="cds_level'+i+'" onchange = setCDSLevel('+i+')><option value="11">11</option><option value="12">12</option></select></li>');
            });
        }
        else
            $('#sortable').append("<p>No data in Media Manager for this object!</p>");
    });

    
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

<ul id="sortable"></ul>

<div style="clear: both; padding-top:20px;">
<hr/>
<input type="button" value="save"></input>
</div>
</form> 
</body>
</html>