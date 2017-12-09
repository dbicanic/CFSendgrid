component accessors="true"{

	public struct function sendSendgrid(
		required string toEmail,
		required string fromEmail,
		required string APIKey,
		required string subject,
		required string content
		){

		var data = {
			statusCode: "",
			statusText: "",
			headerResponse: ""
		};

		var auth = "Bearer " & arguments.APIKey;
		var requestBody = {
	    	"personalizations": [
	    		{
	    			"to": [
	    				{
	    					"email": arguments.toEmail
	    				}
	    			],
	    			"subject": arguments.subject,
	    			"substitutions" : deserializeJSON( arguments.substitutions )
	    		}
	    	],
	    	"from": {
	    		"email": arguments.fromEmail
	    	},
	    	"content": [
	    		{ "type": "text/plain", "value": arguments.content }
	    	]
	    };

	    if( arguments.keyExists("templateID") ){
	    	requestBody[ "template_id" ]= arguments.templateID;
	    };

	    writeDump(requestBody);

		cfhttp( method="POST", charset="utf-8", url="https://api.sendgrid.com/v3/mail/send", result="result" ){
		    cfhttpparam( name="Authorization", type="header", value=auth );
		    cfhttpparam( name="Content-Type", type="header", value="application/json" );
		    cfhttpparam( type="body", value=serializeJSON(requestBody));
		};

		writeDump(result);
		abort;

		data.statusCode = result.status_code;
		data.statusText = result.status_text;
		data.headerResponse = result.header;

		return data;
	}
}