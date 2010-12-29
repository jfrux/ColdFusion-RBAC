<cfcomponent name="objectService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.object.objectService">
		<cfargument name="objectDAO" type="rbac.object.objectDAO" required="true" />
		<cfargument name="objectGateway" type="rbac.object.objectGateway" required="true" />

		<cfset variables.objectDAO = arguments.objectDAO />
		<cfset variables.objectGateway = arguments.objectGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getobject" access="public" output="false" returntype="object">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var object = createObject("component","rbac.object.object").init(argumentCollection=arguments) />
		<cfif object.getobjectID() eq 0>
			<cfreturn object />
		<cfelse>
			<cfreturn variables.objectDAO.read(object) />
		</cfif>
	</cffunction>

	<cffunction name="getobjects" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="locked" type="numeric" required="false" />
		
		<cfreturn variables.objectGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveobject" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="locked" type="numeric" required="false" />
		
		
		<cfset var object = getobject(arguments.id) />
		<cfset object.setid(arguments.id) />
		<cfset object.setname(arguments.name) />
		<cfif structKeyExists(arguments,"description")>
			<cfset object.setdescription(arguments.description) />
		</cfif>
		<cfif structKeyExists(arguments,"locked")>
			<cfset object.setlocked(arguments.locked) />
		</cfif>
		<cfreturn variables.objectDAO.save(object) />
	</cffunction>

	<cffunction name="deleteobject" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var object = createObject("component","rbac.object.object").init(argumentCollection=arguments) />
		<cfreturn variables.objectDAO.delete(object) />
	</cffunction>
</cfcomponent>
