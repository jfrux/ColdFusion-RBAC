<cfcomponent name="rolePermService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.rolePerm.rolePermService">
		<cfargument name="rolePermDAO" type="rbac.rolePerm.rolePermDAO" required="true" />
		<cfargument name="rolePermGateway" type="rbac.rolePerm.rolePermGateway" required="true" />

		<cfset variables.rolePermDAO = arguments.rolePermDAO />
		<cfset variables.rolePermGateway = arguments.rolePermGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getrolePerm" access="public" output="false" returntype="rolePerm">
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="permission_id" type="numeric" required="true" />
		
		<cfset var rolePerm = createObject("component","rbac.rolePerm.rolePerm").init(argumentCollection=arguments) />
		<cfif rolePerm.getrolePermID() eq 0>
			<cfreturn rolePerm />
		<cfelse>
			<cfreturn variables.rolePermDAO.read(rolePerm) />
		</cfif>
	</cffunction>

	<cffunction name="getrolePerms" access="public" output="false" returntype="query">
		<cfargument name="role_id" type="numeric" required="false" />
		<cfargument name="permission_id" type="numeric" required="false" />
		
		<cfreturn variables.rolePermGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saverolePerm" access="public" output="false" returntype="boolean">
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="permission_id" type="numeric" required="true" />
		
		
		<cfset var rolePerm = getrolePerm(arguments.role_idarguments.permission_id) />
		<cfset rolePerm.setrole_id(arguments.role_id) />
		<cfset rolePerm.setpermission_id(arguments.permission_id) />
		<cfreturn variables.rolePermDAO.save(rolePerm) />
	</cffunction>

	<cffunction name="deleterolePerm" access="public" output="false" returntype="boolean">
		<cfargument name="role_id" type="numeric" required="true" />
		<cfargument name="permission_id" type="numeric" required="true" />
		
		<cfset var rolePerm = createObject("component","rbac.rolePerm.rolePerm").init(argumentCollection=arguments) />
		<cfreturn variables.rolePermDAO.delete(rolePerm) />
	</cffunction>
</cfcomponent>
