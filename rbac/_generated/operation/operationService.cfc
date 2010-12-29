<cfcomponent name="operationService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.operation.operationService">
		<cfargument name="operationDAO" type="rbac.operation.operationDAO" required="true" />
		<cfargument name="operationGateway" type="rbac.operation.operationGateway" required="true" />

		<cfset variables.operationDAO = arguments.operationDAO />
		<cfset variables.operationGateway = arguments.operationGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getoperation" access="public" output="false" returntype="operation">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var operation = createObject("component","rbac.operation.operation").init(argumentCollection=arguments) />
		<cfif operation.getoperationID() eq 0>
			<cfreturn operation />
		<cfelse>
			<cfreturn variables.operationDAO.read(operation) />
		</cfif>
	</cffunction>

	<cffunction name="getoperations" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="_create" type="numeric" required="false" />
		<cfargument name="_read" type="numeric" required="false" />
		<cfargument name="_update" type="numeric" required="false" />
		<cfargument name="_delete" type="numeric" required="false" />
		<cfargument name="locked" type="numeric" required="false" />
		
		<cfreturn variables.operationGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveoperation" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="_create" type="numeric" required="false" />
		<cfargument name="_read" type="numeric" required="false" />
		<cfargument name="_update" type="numeric" required="false" />
		<cfargument name="_delete" type="numeric" required="false" />
		<cfargument name="locked" type="numeric" required="false" />
		
		
		<cfset var operation = getoperation(arguments.id) />
		<cfset operation.setid(arguments.id) />
		<cfset operation.setname(arguments.name) />
		<cfif structKeyExists(arguments,"description")>
			<cfset operation.setdescription(arguments.description) />
		</cfif>
		<cfif structKeyExists(arguments,"_create")>
			<cfset operation.set_create(arguments._create) />
		</cfif>
		<cfif structKeyExists(arguments,"_read")>
			<cfset operation.set_read(arguments._read) />
		</cfif>
		<cfif structKeyExists(arguments,"_update")>
			<cfset operation.set_update(arguments._update) />
		</cfif>
		<cfif structKeyExists(arguments,"_delete")>
			<cfset operation.set_delete(arguments._delete) />
		</cfif>
		<cfif structKeyExists(arguments,"locked")>
			<cfset operation.setlocked(arguments.locked) />
		</cfif>
		<cfreturn variables.operationDAO.save(operation) />
	</cffunction>

	<cffunction name="deleteoperation" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var operation = createObject("component","rbac.operation.operation").init(argumentCollection=arguments) />
		<cfreturn variables.operationDAO.delete(operation) />
	</cffunction>
</cfcomponent>
