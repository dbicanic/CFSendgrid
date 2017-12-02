component{

	this.allowedMethods = {
		sendSendgrid: "GET"
	}

	function preHandler( event, rc, prc, action, eventArguments ){
		variables.sendgridService = populateModel( "service.email.SendgridService" );
	}
	function postHandler( event, rc, prc, action, eventArguments ){
		// prc.results[ "errors" ] = variables.sendgridService.getErrors();
	}

	public struct function sendSendgrid( event, rc, prc ){
		var response = sendgridService.sendSendgrid( arguementCollection=rc );

		event.renderData( type="json", data=response );
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
