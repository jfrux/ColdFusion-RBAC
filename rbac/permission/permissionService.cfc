<cfcomponent name="permissionService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.permission.permissionService">
		<cfargument name="permissionDAO" type="rbac.permission.permissionDAO" required="true" />
		<cfargument name="permissionGateway" type="rbac.permission.permissionGateway" required="true" />

		<cfset variables.permissionDAO = arguments.permissionDAO />
		<cfset variables.permissionGateway = arguments.permissionGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getpermission" access="public" output="false" returntype="permission">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="object_id" type="numeric" required="true" />
		<cfargument name="operation_id" type="numeric" required="true" />
		
		<cfset var permission = createObject("component","rbac.permission.permission").init(argumentCollection=arguments) />
		<cfif permission.getpermissionID() eq 0>
			<cfreturn permission />
		<cfelse>
			<cfreturn variables.permissionDAO.read(permission) />
		</cfif>
	</cffunction>

	<cffunction name="getpermissions" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="object_id" type="numeric" required="false" />
		<cfargument name="operation_id" type="numeric" required="false" />
		
		<cfreturn variables.permissionGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savepermission" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="object_id" type="numeric" required="true" />
		<cfargument name="operation_id" type="numeric" required="true" />
		
		
		<cfset var permission = getpermission(arguments.idarguments.namearguments.object_idarguments.operation_id) />
		<cfset permission.setid(arguments.id) />
		<cfset permission.setname(arguments.name) />
		<cfif structKeyExists(arguments,"description")>
			<cfset permission.setdescription(arguments.description) />
		</cfif>
		<cfset permission.setobject_id(arguments.object_id) />
		<cfset permission.setoperation_id(arguments.operation_id) />
		<cfreturn variables.permissionDAO.save(permission) />
	</cffunction>

	<cffunction name="deletepermission" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="object_id" type="numeric" required="true" />
		<cfargument name="operation_id" type="numeric" required="true" />
		
		<cfset var permission = createObject("component","rbac.permission.permission").init(argumentCollection=arguments) />
		<cfreturn variables.permissionDAO.delete(permission) />
	</cffunction>
</cfcomponent>
