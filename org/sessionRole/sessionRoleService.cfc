<cfcomponent name="sessionRoleService" output="false">

	<cffunction name="init" access="public" output="false" returntype="org.sessionRole.sessionRoleService">
		<cfargument name="sessionRoleDAO" type="org.sessionRole.sessionRoleDAO" required="true" />
		<cfargument name="sessionRoleGateway" type="org.sessionRole.sessionRoleGateway" required="true" />

		<cfset variables.sessionRoleDAO = arguments.sessionRoleDAO />
		<cfset variables.sessionRoleGateway = arguments.sessionRoleGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getsessionRole" access="public" output="false" returntype="sessionRole">
		<cfargument name="session_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		
		<cfset var sessionRole = createObject("component","org.sessionRole.sessionRole").init(argumentCollection=arguments) />
		<cfif sessionRole.getsessionRoleID() eq 0>
			<cfreturn sessionRole />
		<cfelse>
			<cfreturn variables.sessionRoleDAO.read(sessionRole) />
		</cfif>
	</cffunction>

	<cffunction name="getsessionRoles" access="public" output="false" returntype="query">
		<cfargument name="session_id" type="numeric" required="false" />
		<cfargument name="role_id" type="numeric" required="false" />
		
		<cfreturn variables.sessionRoleGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savesessionRole" access="public" output="false" returntype="boolean">
		<cfargument name="session_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		
		
		<cfset var sessionRole = getsessionRole(arguments.session_idarguments.role_id) />
		<cfset sessionRole.setsession_id(arguments.session_id) />
		<cfset sessionRole.setrole_id(arguments.role_id) />
		<cfreturn variables.sessionRoleDAO.save(sessionRole) />
	</cffunction>

	<cffunction name="deletesessionRole" access="public" output="false" returntype="boolean">
		<cfargument name="session_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		
		<cfset var sessionRole = createObject("component","org.sessionRole.sessionRole").init(argumentCollection=arguments) />
		<cfreturn variables.sessionRoleDAO.delete(sessionRole) />
	</cffunction>
</cfcomponent>
