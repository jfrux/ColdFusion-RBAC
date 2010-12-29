<cfcomponent name="roleService" output="false">

	<cffunction name="init" access="public" output="false" returntype="org.role.roleService">
		<cfargument name="roleDAO" type="org.role.roleDAO" required="true" />
		<cfargument name="roleGateway" type="org.role.roleGateway" required="true" />

		<cfset variables.roleDAO = arguments.roleDAO />
		<cfset variables.roleGateway = arguments.roleGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getrole" access="public" output="false" returntype="role">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var role = createObject("component","org.role.role").init(argumentCollection=arguments) />
		<cfif role.getroleID() eq 0>
			<cfreturn role />
		<cfelse>
			<cfreturn variables.roleDAO.read(role) />
		</cfif>
	</cffunction>

	<cffunction name="getroles" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		
		<cfreturn variables.roleGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saverole" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="description" type="string" required="false" />
		
		
		<cfset var role = getrole(arguments.id) />
		<cfset role.setid(arguments.id) />
		<cfset role.setname(arguments.name) />
		<cfif structKeyExists(arguments,"description")>
			<cfset role.setdescription(arguments.description) />
		</cfif>
		<cfreturn variables.roleDAO.save(role) />
	</cffunction>

	<cffunction name="deleterole" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var role = createObject("component","org.role.role").init(argumentCollection=arguments) />
		<cfreturn variables.roleDAO.delete(role) />
	</cffunction>
</cfcomponent>
