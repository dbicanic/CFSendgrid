component extends="modules.cbrestbasehandler.handlers.BaseHandler" {

	this.allowedMethods = {
		sendSendgrid: "POST"
	};

	function preHandler( event, rc, prc, action, eventArguments ){
		variables.sendgridService = populateModel( "service.email.SendgridService" );
		super.getHeaderParametersPassedin( rc );
	}

	public any function sendSendgrid( event, rc, prc ){
		var response = sendgridService.sendSendgrid( argumentCollection = rc );
		// event.renderData( type="json", data=rc.response );
		prc.response.setData( response );
	}

}
