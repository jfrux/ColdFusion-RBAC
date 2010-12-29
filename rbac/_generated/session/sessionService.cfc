<cfcomponent name="sessionService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.session.sessionService">
		<cfargument name="sessionDAO" type="rbac.session.sessionDAO" required="true" />
		<cfargument name="sessionGateway" type="rbac.session.sessionGateway" required="true" />

		<cfset variables.sessionDAO = arguments.sessionDAO />
		<cfset variables.sessionGateway = arguments.sessionGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getsession" access="public" output="false" returntype="session">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var session = createObject("component","rbac.session.session").init(argumentCollection=arguments) />
		<cfif session.getsessionID() eq 0>
			<cfreturn session />
		<cfelse>
			<cfreturn variables.sessionDAO.read(session) />
		</cfif>
	</cffunction>

	<cffunction name="getsessions" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		
		<cfreturn variables.sessionGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savesession" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="created" type="date" required="false" />
		
		
		<cfset var session = getsession(arguments.id) />
		<cfset session.setid(arguments.id) />
		<cfset session.setname(arguments.name) />
		<cfif structKeyExists(arguments,"created")>
			<cfset session.setcreated(arguments.created) />
		</cfif>
		<cfreturn variables.sessionDAO.save(session) />
	</cffunction>

	<cffunction name="deletesession" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var session = createObject("component","rbac.session.session").init(argumentCollection=arguments) />
		<cfreturn variables.sessionDAO.delete(session) />
	</cffunction>
</cfcomponent>
