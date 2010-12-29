<cfcomponent displayname="objectDAO" hint="table ID column = id">

	<cffunction name="init" access="public" output="false" returntype="rbac.object.objectDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="object" type="rbac.object.object" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_object
					(
					name,
					description,
					locked
					)
				VALUES
					(
					<cfqueryparam value="#arguments.object.getname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.object.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.object.getdescription())#" />,
					<cfqueryparam value="#arguments.object.getlocked()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.object.getlocked())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="rbac.object.object">
		<cfargument name="object" type="rbac.object.object" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					id,
					name,
					description,
					locked
				FROM	ac_object
				WHERE	id = <cfqueryparam value="#arguments.object.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset objectBean = arguments.object.init(argumentCollection=strReturn)>
			<cfreturn objectBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="object" type="rbac.object.object" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_object
				SET
					name = <cfqueryparam value="#arguments.object.getname()#" CFSQLType="cf_sql_varchar" />,
					description = <cfqueryparam value="#arguments.object.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.object.getdescription())#" />,
					locked = <cfqueryparam value="#arguments.object.getlocked()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.object.getlocked())#" />
				WHERE	id = <cfqueryparam value="#arguments.object.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="object" type="rbac.object.object" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_object 
				WHERE	id = <cfqueryparam value="#arguments.object.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="object" type="rbac.object.object" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_object
			WHERE	id = <cfqueryparam value="#arguments.object.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="object" type="rbac.object.object" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.object)>
			<cfset success = update(arguments.object) />
		<cfelse>
			<cfset success = create(arguments.object) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
