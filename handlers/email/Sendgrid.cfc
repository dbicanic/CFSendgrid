component extends="modules.cbrestbasehandler.handlers.BaseHandler" {

	this.allowedMethods = {
		sendSendgrid: "POST"
	};

	function preHandler( event, rc, prc, action, eventArguments ){
		variables.sendgridService = populateModel( "service.email.SendgridService" );
		super.getHeaderParametersPassedin( rc );
	}
	function postHandler( event, rc, prc, action, eventArguments ){
		// prc.results[ "errors" ] = variables.sendgridService.getErrors();
	}

	public any function sendSendgrid( event, rc, prc ){
		var response = sendgridService.sendSendgrid( argumentCollection = rc );
		return "test";
		// event.renderData( type="json", data=response );
	}
	/**
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

}
