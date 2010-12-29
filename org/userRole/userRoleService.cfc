<cfcomponent name="userRoleService" output="false">

	<cffunction name="init" access="public" output="false" returntype="org.userRole.userRoleService">
		<cfargument name="userRoleDAO" type="org.userRole.userRoleDAO" required="true" />
		<cfargument name="userRoleGateway" type="org.userRole.userRoleGateway" required="true" />

		<cfset variables.userRoleDAO = arguments.userRoleDAO />
		<cfset variables.userRoleGateway = arguments.userRoleGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getuserRole" access="public" output="false" returntype="userRole">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="tenant_id" type="numeric" required="true" />
		
		<cfset var userRole = createObject("component","org.userRole.userRole").init(argumentCollection=arguments) />
		<cfif userRole.getuserRoleID() eq 0>
			<cfreturn userRole />
		<cfelse>
			<cfreturn variables.userRoleDAO.read(userRole) />
		</cfif>
	</cffunction>

	<cffunction name="getuserRoles" access="public" output="false" returntype="query">
		<cfargument name="user_id" type="numeric" required="false" />
		<cfargument name="role_id" type="numeric" required="false" />
		<cfargument name="tenant_id" type="numeric" required="false" />
		
		<cfreturn variables.userRoleGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveuserRole" access="public" output="false" returntype="boolean">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="tenant_id" type="numeric" required="false" />
		
		
		<cfset var userRole = getuserRole(arguments.user_idarguments.role_idarguments.tenant_id) />
		<cfset userRole.setuser_id(arguments.user_id) />
		<cfset userRole.setrole_id(arguments.role_id) />
		<cfif structKeyExists(arguments,"tenant_id")>
			<cfset userRole.settenant_id(arguments.tenant_id) />
		</cfif>
		<cfreturn variables.userRoleDAO.save(userRole) />
	</cffunction>

	<cffunction name="deleteuserRole" access="public" output="false" returntype="boolean">
		<cfargument name="user_id" type="numeric" required="true" />
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="tenant_id" type="numeric" required="false" />
		
		<cfset var userRole = createObject("component","org.userRole.userRole").init(argumentCollection=arguments) />
		<cfreturn variables.userRoleDAO.delete(userRole) />
	</cffunction>
</cfcomponent>
