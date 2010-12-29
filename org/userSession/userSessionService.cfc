<cfcomponent name="userSessionService" output="false">

	<cffunction name="init" access="public" output="false" returntype="org.userSession.userSessionService">
		<cfargument name="userSessionDAO" type="org.userSession.userSessionDAO" required="true" />
		<cfargument name="userSessionGateway" type="org.userSession.userSessionGateway" required="true" />

		<cfset variables.userSessionDAO = arguments.userSessionDAO />
		<cfset variables.userSessionGateway = arguments.userSessionGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getuserSession" access="public" output="false" returntype="userSession">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="session_id" type="numeric" required="true" />
		
		<cfset var userSession = createObject("component","org.userSession.userSession").init(argumentCollection=arguments) />
		<cfif userSession.getuserSessionID() eq 0>
			<cfreturn userSession />
		<cfelse>
			<cfreturn variables.userSessionDAO.read(userSession) />
		</cfif>
	</cffunction>

	<cffunction name="getuserSessions" access="public" output="false" returntype="query">
		<cfargument name="user_id" type="numeric" required="false" />
		<cfargument name="session_id" type="numeric" required="false" />
		
		<cfreturn variables.userSessionGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveuserSession" access="public" output="false" returntype="boolean">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="session_id" type="numeric" required="true" />
		
		
		<cfset var userSession = getuserSession(arguments.user_idarguments.session_id) />
		<cfset userSession.setuser_id(arguments.user_id) />
		<cfset userSession.setsession_id(arguments.session_id) />
		<cfreturn variables.userSessionDAO.save(userSession) />
	</cffunction>

	<cffunction name="deleteuserSession" access="public" output="false" returntype="boolean">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="session_id" type="numeric" required="true" />
		
		<cfset var userSession = createObject("component","org.userSession.userSession").init(argumentCollection=arguments) />
		<cfreturn variables.userSessionDAO.delete(userSession) />
	</cffunction>
</cfcomponent>
