component{
	// property name="emailGateway" inject="apps.messaging.v1.gateway.email.EmailGateway";

	// property name="sendGridAPIKey" 	type="string";

	public struct function sendSendgrid(){

		data = {
			"statusCode": "",
			"statusText": "",
			"headerResponse": ""
		};

		cfhttp( method="POST", charset="utf-8", url="https://api.sendgrid.com/v3/mail/send", result="result" ){
		    cfhttpparam( name="Authorization", type="header", value="Bearer #arugments.apikey#" );
		    cfhttpparam( name="Content-Type", type="header", value="application/json" );
		    cfhttpparam( type="body", value=serializeJSON({
		    	"personalizations": [
		    		{ "to": [
		    			{"email": "dbicanic77@gmail.com"}
		    			]
		    		}
		    	],
		    	"from": {
		    		"email": "dbicanic77@gmail.com"
		    	},
		    	"subject": "Hello, World!",
		    	"content": [
		    		{ "type": "text/plain", "value": "Text" }
		    	]
		    }));
		}

		data.statusCode = result.status_code;
		data.statusText = result.status_text;
		data.headerResponse = result.header;

		return data;
	}
}