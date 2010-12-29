<cfcomponent name="tenantKindService" output="false">

	<cffunction name="init" access="public" output="false" returntype="org.tenantKind.tenantKindService">
		<cfargument name="tenantKindDAO" type="org.tenantKind.tenantKindDAO" required="true" />
		<cfargument name="tenantKindGateway" type="org.tenantKind.tenantKindGateway" required="true" />

		<cfset variables.tenantKindDAO = arguments.tenantKindDAO />
		<cfset variables.tenantKindGateway = arguments.tenantKindGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="gettenantKind" access="public" output="false" returntype="tenantKind">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var tenantKind = createObject("component","org.tenantKind.tenantKind").init(argumentCollection=arguments) />
		<cfif tenantKind.gettenantKindID() eq 0>
			<cfreturn tenantKind />
		<cfelse>
			<cfreturn variables.tenantKindDAO.read(tenantKind) />
		</cfif>
	</cffunction>

	<cffunction name="gettenantKinds" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		
		<cfreturn variables.tenantKindGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savetenantKind" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		
		
		<cfset var tenantKind = gettenantKind(arguments.id) />
		<cfset tenantKind.setid(arguments.id) />
		<cfset tenantKind.setname(arguments.name) />
		<cfif structKeyExists(arguments,"description")>
			<cfset tenantKind.setdescription(arguments.description) />
		</cfif>
		<cfif structKeyExists(arguments,"created")>
			<cfset tenantKind.setcreated(arguments.created) />
		</cfif>
		<cfreturn variables.tenantKindDAO.save(tenantKind) />
	</cffunction>

	<cffunction name="deletetenantKind" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var tenantKind = createObject("component","org.tenantKind.tenantKind").init(argumentCollection=arguments) />
		<cfreturn variables.tenantKindDAO.delete(tenantKind) />
	</cffunction>
</cfcomponent>
