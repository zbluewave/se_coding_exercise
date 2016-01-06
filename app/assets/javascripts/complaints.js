function ComplaintPage(){
	var complaint_type = $("select[name='complaint_type']");
	var status = $("select[name='status']");
	var zip = $("input[name='zip']");
	var street = $("input[name='street']");
	var result_table = $("#result-display");

	var initComplaintType = function () {
		$.getJSON("/api/v1/incident/complaints_types", function(data) {
			$(data).each(function(){
				complaint_type.append($("<option/>", {
                    value: this,
                    text: this
                }));
		    });
	    });
	};

	var initStatus = function () {
		$.getJSON("/api/v1/incident/statuses", function(data) {
			$(data).each(function(){
				status.append($("<option/>", {
                    value: this,
                    text: this
                }));
		    });
	    });
	};

	var initSearchButton = function() {
        $("button[type='submit']").click(function(e) {
            e.preventDefault();
            result_table.html("");
            $.getJSON(
            	"/api/v1/incident/search", 
            	{
            		'complaint_type': complaint_type.val(),
            		'status': status.val(),
            		'zip': zip.val(),
            		'street': street.val()
            	}, 
            	function(data) {
            		$(data).each(function(){
            			result_table.append(
            				"<tr>" + 
            				"<td></td>" +
            				"<td>" + this.complaint_type +"</td>" +
            				"<td>" + this.street + "</td>" +
            				"<td>" + this.status + "</td>" +
            				"<td>" + this.zip +"</td>" +
            				"</tr>"
            			);
            		});
	            }
	        );
        });
	};

	initComplaintType();
	initStatus();
	initSearchButton();
};

$(document).ready(function() {
  complaint = new ComplaintPage();
});
