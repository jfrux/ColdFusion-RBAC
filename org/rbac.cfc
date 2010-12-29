<cfcomponent displayname="RBAC" hint="This is an implementation of NIST RBAC open standard for ColdFusion">
	<!---
	# NIST Core RBAC library
	# @package NIST RBAC
	# @author Joshua F. Rountree (joshua@swodev.com)
	# @version 0.01
	
	##########################################################
	# Copyright 2010 Joshua F. Rountree
	#
	# Licensed under the Apache License, Version 2.0 (the "License");
	# you may not use this file except in compliance with the License.
	# You may obtain a copy of the License at
	#
	#   http://www.apache.org/licenses/LICENSE-2.0
	#
	# Unless required by applicable law or agreed to in writing, software
	# distributed under the License is distributed on an "AS IS" BASIS,
	# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	# See the License for the specific language governing permissions and
	# limitations under the License.
	##########################################################
	--->
	
	<cffunction name="init" access="public" returntype="rbac" hint="instantiates the rbac system">
		<cfargument name="datasource" type="string" required="yes">
		<cfargument name="tableprefix" type="string" required="no" hint="default is 'ac_'" default="ac_">
		<cfargument name="dbms" type="string" required="yes" hint="database type (mysql, mssql, etc.)">
		<cfargument name="usertable" type="string" required="no" default="ac_user" hint="If you have an existing user table.">
		<cfargument name="username_col" type="string" required="no" default="username" hint="If existing users table, what is username field?">
		<cfargument name="password_col" type="string" required="no" default="password" hint="If existing users table, what is password field?">
		
		<cfset variables.dsn = arguments.datasource />
		<cfset variables.prefix = arguments.tableprefix />
		<cfset variables.dbtype = arguments.dbms />
		<cfset variables.un_col = arguments.username_col />
		<cfset variables.pw_col = arguments.password_col />
		
		<cfreturn this>
	</cffunction>
	
	<!--- NIST RBAC standard functions --->
	
	<!---
	/**
	* This command creates a new RBAC user. 
	*
	* The command is valid only if the new user is not already a member of the
	* USERS data set. The USER data set is updated. The new user does not own 
	* any session at the time of its creation. 
	*
	* @param string $user username
	* @param string $password password
	* @param string $first_name first name
	* @param string $family_name family name
	* @param string $email email address
	* @return boolean
	* 
	* Example:
	* <code>
	* <?php
	* AddUser('username', 'password', 'first_name', 'family_name', 'email');
	* ?>
	* </code>
	*/
	--->
	<cffunction name="AddUser" access="public" output="no" returntype="any">
		<cfargument name="username" type="string" required="no" />
		<cfargument name="password" type="string" required="no" />
		<cfargument name="first_name" type="string" required="no" />
		<cfargument name="last_name" type="string" required="no" />
		<cfargument name="email" type="string" required="no" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	
	<!---
	/**
	* This command deletes an existing user from the RBAC database. 
	
	* The command is valid if and only if the user to be deleted is a member of the USERS data 
	* set. The USERS and UA data sets and the assigned_users function are updated.
	* The session associated with the deleted user is removed as well.
	* This function calls the {@link DeleteSession()} function to remove any open sessions.
	*
	* @param array $users an array of usernames
	* @return boolean
	*
	*/--->
	<cffunction name="DeleteUser" access="public" output="no" returntype="any">
		<cfargument name="users" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	<!---
	/**
	* This command creates a new role. 
	* The command is valid if and only if the new 
	* role is not already a member of the ROLES data set. The ROLES data set and 
	* the functions assigned_users and assigned_permissions are updated. Initially,
	* no user or permission is assigned to the new role. 
	*
	* @param string $name // role name
	* @param string $description // role description
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddRole('role');
	* ?>
	* </code>
	*/--->
	<cffunction name="AddRole" access="public" output="no" returntype="any">
		<cfargument name="name" type="string" required="yes" />
		<cfargument name="description" type="string" required="no" default="" />

		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	
	<!---
	/**
	* This command deletes an existing role from the RBAC database. 
	*
	* The command is valid if and only if the role to be deleted is a member of the ROLES data set.
	* The session associated with the deleted role is removed as well.
	* This function calls the {@link DeleteSession()} function to remove any open sessions.
	*
	* @param array $roles an array of role names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeleteRole(array('role','role','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeleteRole" access="public" output="no" returntype="any">
		<cfargument name="roles" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	
	<!---
	/**
	* This command assigns a user to a role. 
	*
	* The command is valid if and only if 
	* the user is a member of the USERS data set, the role is a member of the 
	* ROLES data set, and the user is not already assigned to the role. The data 
	* set UA and the function assigned_users are updated to reflect the assignment. 
	*
	* @param string $user username
	* @param array $roles an array of role names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AssignUser('username', array('role','role','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="AssignUser" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		<cfargument name="roles" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	
	<!---
	/**
	* This command deletes the assignment of the user to the role. 
	*
	* The command is valid if and only if the user is a member of the USERS data set, the role
	* is a member of the ROLES data set, and the user is assigned to the role.
	* This function calls the {@link DeleteSession()} function to remove any open sessions.
	*
	* @param string $user username
	* @param array $roles and array of role names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeassignUser('username', array('role','role','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeassignUser" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		<cfargument name="roles" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>

	<!---
	/**
	* This command grants a role the permission to perform an operation on an
	* object to a role. 
	*
	* The command may be implemented as granting permissions
	* to a group corresponding to that role, i.e., setting the access control
	* list of the object involved.
	* The command is valid if and only if the pair (operation, object) represents 
	* a permission, and the role is a member of the ROLES data set. 
	*
	* @param array $permission an array consisting of a combination of object and operation
	* @param string $role role name
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* GrantPermission(array(array('object', 'operation')), role);
	* ?>
	* </code>
	*/--->
	<cffunction name="GrantPermission" access="public" output="no" returntype="any">
		<cfargument name="permissions" type="array" required="yes" />
		<cfargument name="role" type="numeric" required="yes" />
		
		
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	<!---
	/**
	* This command revokes the permission to perform an operation on an object from 
	* the set of permissions assigned to a role. 
	*
	* The command is valid if and only if the pair (operation, object) represents 
	* a permission, the role is a member of the ROLES data set, and the permission 
	* is assigned to that role. 
	*
	* @param array $permission an array consisting of a combination of object and operation
	* @param string $role role name
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* RevokePermission(array(array('object', 'operation')), role);
	* ?>
	* </code>
	*/--->
	<cffunction name="RevokePermission" access="public" output="no" returntype="any">
		<cfargument name="permissions" type="array" required="yes" />
		<cfargument name="role" type="numeric" required="no" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	
	<!---
	/**
	* This function creates a new session with a given user as owner and an active 
	* role set.
	*
	* This function creates a new session with a given user as owner and an active 
	* role set. The function is valid if and only if:
	* - The user is a member of the USERS data set, and
	* - The active role set is a subset of the roles assigned to that user. In a 
	*   RBAC implementation, the session's active roles might actually be the groups 
	*   that represent those roles.
	* This function calls the {@link DeleteSession()} function to remove any expired sessions.
	*
	* @param numeric $user username
	* @param string $session session identifier
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* CreateSession('user', 'session');
	* ?>
	* </code>
	*/--->
	<cffunction name="CreateSession" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		<cfargument name="session" type="string" required="yes" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function deletes a given session with a given owner user. 
	*
	* The function is valid if and only if the session identifier is a member 
	* of the SESSIONS data set, the user is a member of the USERS data set, 
	* and the session is owned by the given user. 
	*
	* @param array $sessions an array of session identifiers
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeleteSession(array('session','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeleteSession" access="public" output="no" returntype="any">
		<cfargument name="sessions" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function adds a role as an active role of a session whose owner is a 
	* given user
	*
	* This function adds a role as an active role of a session whose owner is a 
	* given user. The function is valid if and only if:
	* - The user is a member of the USERS data set, and
	* - The role is a member of the ROLES data set, and
	* - The session identifier is a member of the SESSIONS data set, and
	* - The role is assigned to the user, and
	* - The session is owned by that user.
	*
	* @param string $user username
	* @param string $session session identifier
	* @param array $roles an array of role names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddActiveRole('username', 'session', array('role','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="AddActiveRole" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		<cfargument name="session" type="string" required="yes" />
		<cfargument name="roles" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function deletes a role from the active role set of a session owned by a 
	* given user. 
	*
	* The function is valid if and only if the user is a member of the 
	* USERS data set, the session identifier is a member of the SESSIONS data set, 
	* the session is owned by the user, and the role is an active role of that 
	* session. 
	*
	* @param string $user username
	* @param string $session session identifier
	* @param array $roles an array of role names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DropActiveRole('username', 'session', array('role','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DropActiveRole" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		<cfargument name="session" type="string" required="yes" />
		<cfargument name="roles" type="array" required="yes" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function returns a Boolean value meaning whether the subject of a given 
	* session is allowed or not to perform a given operation on a given object. 
	*
	* The function is valid if and only if the session identifier is a member of the 
	* SESSIONS data set, the object is a member of the OBJS data set, and the 
	* operation is a member of the OPS data set. The session’s subject has the 
	* permission to perform the operation on that object if and only if that 
	* permission is assigned to (at least) one of the session’s active roles. 
	*
	* @param string $session session identifier
	* @param string $object object name
	* @param string $operation operation name
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* CheckAccess('session', 'object', 'operation');
	* ?>
	* </code>
	*/--->
	<cffunction name="CheckAccess" access="public" output="no" returntype="any">
		<cfargument name="session" type="string" required="yes" />
		<cfargument name="object" type="string" required="yes" />
		<cfargument name="operation" type="string" required="yes" />
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function returns the set of users assigned to a given role. The function
	* is valid if and only if the role is a member of the ROLES data set. 
	*
	* @param string $role role name
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* AssignedUsers('rolename');
	* ?>
	* </code>
	*/--->
	<cffunction name="AssignedUsers" access="public" output="no" returntype="any">
		<cfargument name="role" type="numeric" required="yes" />
		
		
		<!---
		PHP Code:
		
		--->
		
	</cffunction>
	
	
	<!---
	/**
	* This function returns the set of roles assigned to a given user. 
	* The function is valid if and only if the user is a member of the USERS data set.  
	*
	* @param string $user username
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* AssignedRoles('username');
	* ?>
	* </code>
	*/--->
	<cffunction name="AssignedRoles" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		
		
		<!---
			PHP Code:
			($user='')>
			/* Filter input */
			  $user = filter_var($user, FILTER_SANITIZE_STRING);
			  /* Select all roles that are associated with the user */
			$sql = 'SELECT DISTINCT role.name AS Role
			FROM user
			INNER JOIN user_role USING (user_id)
			INNER JOIN role USING (role_id)
			WHERE user.username = ?';
			/* Execute the query and return the result set */
			return QueryEngine($sql, array(&$user), 's', 0);
		}--->
	</cffunction>

	<!---
	/**
	* This function returns the set of permissions (op, obj) granted to a given 
	* role. The function is valid if and only if the role is a member of the 
	* ROLES data set.
	*
	* @param string $role role name
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* RolePermissions('rolename');
	* ?>
	* </code>
	*/ --->
	<cffunction name="RolePermissions" access="public" output="no" returntype="any">
		<cfargument name="role" type="numeric" required="yes" />
	
		<!---
			PHP Code:
			($role='')>
			/* Filter input */
			  $role = filter_var($role, FILTER_SANITIZE_STRING);
			  /* Select all permissions that are associated with the role */
			$sql = 'SELECT DISTINCT permission.name AS Permission, object.name AS Object, operation.name AS Operation
			FROM permission
			INNER JOIN object USING (object_id)
			INNER JOIN operation USING (operation_id)
			INNER JOIN role_permission USING (permission_id)
			INNER JOIN role USING (role_id)
			WHERE role.name = ?';
			return QueryEngine($sql, array(&$role), 's', 0);
		}--->
	</cffunction>
	
	<!---
	/**
	* This function returns the permissions a given user gets through his/her 
	* assigned roles. The function is valid if and only if the user is a member of 
	* the USERS data set.
	*
	* @param string $user username
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* UserPermissions('username');
	* ?>
	* </code>
	*/--->
	<cffunction name="UserPermissions" access="public" output="no" returntype="any">
		<cfargument name="user" type="numeric" required="yes" />
		
		<!---
		PHP Code:
		
		($user='')>
		/* Filter input */
		$user = filter_var($user, FILTER_SANITIZE_STRING);
		/* Select all permissions that are associated with a given user */
		$sql = 'SELECT DISTINCT role.name AS Role, permission.name AS Permission
		FROM permission
		INNER JOIN role_permission USING (permission_id)
		INNER JOIN role USING (role_id)
		INNER JOIN user_role USING (role_id)
		INNER JOIN user USING (user_id)
		WHERE user.username = ?';
		return QueryEngine($sql, array(&$user), 's', 0);--->
	</cffunction>
	
	
	<!---
	/**
	* This function returns the active roles associated with a session. The function
	* is valid if and only if the session identifier is a member of the SESSIONS 
	* data set. 
	*
	* @param string $session session identifier
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* SessionRoles('session');
	* ?>
	* </code>
	*/--->
	<cffunction name="SessionRoles" access="public" output="no" returntype="any">
		<cfargument name="session" type="string" required="yes" />
		
		<!---
		PHP Code:
		
		($session='')>
		/* Filter input */
		$session = filter_var($session, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_HIGH|FILTER_FLAG_ENCODE_LOW);
		/* Select all roles that are associated with the active session */
		$sql = 'SELECT DISTINCT role.name AS Role
		FROM role
		INNER JOIN session_role USING (role_id)
		INNER JOIN session USING (session_id)
		WHERE session.name = ?';
		return QueryEngine($sql, array(&$session), 's', 0);--->
	</cffunction>
	
	
	<!---
	/**
	* This function returns the permissions of the session, i.e., the permissions 
	* assigned to its active roles. The function is valid if and only if the session
	* identifier is a member of the SESSIONS data set. 
	*
	* @param string $session session identifier
	* @return array
	*
	* Example:
	* <code>
	* <?php
	* SessionPermissions('session');
	* ?>
	* </code>
	*/--->
	<cffunction name="SessionPermissions" access="public" output="no" returntype="any">
		<cfargument name="session" type="string" required="yes" />
		
		<!---
		PHP Code:
		
		/* Filter input */
		$session = filter_var($session, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_HIGH|FILTER_FLAG_ENCODE_LOW);
		/* Select all permissions that are associated with the active session */
		$sql = 'SELECT DISTINCT permission.name AS Permission, object.name AS Object, operation.name AS Operation
		FROM permission
		INNER JOIN object USING (object_id)
		INNER JOIN operation USING (operation_id)
		INNER JOIN role_permission USING (permission_id)
		INNER JOIN session_role USING (role_id)
		INNER JOIN session USING (session_id)
		WHERE session.name = ?';
		return QueryEngine($sql, array(&$session), 's', 0);
		--->	
	</cffunction>


	<!---
	NON STANDARD API CALLS
	
	These API calls are not part of the NIST RBAC standard as the standard states
	the following:
	"Creation and Maintenance of Element Sets: The basic element sets in Core 
	RBAC are USERS, ROLES, OPS and OBS. 
		Of these element sets, OPS and OBS are 
		considered predefined by the underlying information system for which RBAC is 
		deployed. For example, a banking system may have predefined transactions 
		(OPS) for savings deposit and others, and predefined data sets (OBS) such as
		savings files, address files, and other necessary data.  
	 
	For situations in which no predefined element sets for OPS and OBS are
	available we have added 6 additional, non-standard, functions:
		- AddPermission: this will add a permission with create, read, update and delete
							aspects and the object to which the permission belongs
		- DeletePermission: this will remove a permission
		- AddObject: this will add an object as the basis for a permission
		- DeleteObject: this will delete an object (and it's associated permissions)
		- AddOperation: this will add an operation as the basis for a permission
		- DeleteOperation: this will delete an operation (and it's associated permissions)
	--->


	<!---
	/**
	* This command creates a new permission. 
	*
	* @param string $permission permission name
	* @param string $object object name
	* @param string $operation operation name
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddPermission('permission', 'object', 'operation');
	* ?>
	* </code>
	*/--->
	<cffunction name="AddPermission" access="public" output="no" returntype="any">
		<cfargument name="permission" type="string" required="yes" />
		<cfargument name="object" type="numeric" required="yes" />
		<cfargument name="operation" type="numeric" required="yes" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	
	<!---
	/**
	* Delete a permission
	*
	* @param array $permissions array of permission names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeletePermission(array('permission', '...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeletePermission" access="public" output="no" returntype="any">
		<cfargument name="permissions" type="array" required="no" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
		
	
	
	<!---
	/**
	* Add an Object to the database that is the subject of a permission
	*
	* @param string $object object name
	* @param boolean $locked is the object locked or not
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddObject('object', '0 or 1');
	* ?>
	* </code>
	*/--->
	<cffunction name="AddObject" access="public" output="no" returntype="any">
		<cfargument name="object" type="numeric" required="yes" />
		<cfargument name="locked" type="boolean" required="no" default="false" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	   
	
	
	
	<!---
	/**
	* Delete an Object
	*
	* @param array $objects array of object names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeleteObject(array('object', '...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeleteObject" access="public" output="no" returntype="any">
		<cfargument name="objects" type="array" required="yes" hint="array of object id's" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	<!---
	/**
	* Add an Operation to the database that is the subject of a permission
	*
	* @param string $operation operation name
	* @param string $mask a bitmask to determine create, read, update and delete settings
	* @param boolean $locked is the operation locked or not
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddOperation('operation', '0000 - 1111', '0 or 1');
	* ?>* </code>
	*/--->
	<cffunction name="AddOperation" access="public" output="no" returntype="any">
		<cfargument name="name" type="string" required="yes" />
		<cfargument name="description" type="string" required="no" default="" />
		<cfargument name="mask" type="string" required="no" default="0000" hint="0000 - 1111 representing create,read,update,delete" />
		<cfargument name="locked" type="boolean" required="no" default="0" />
		
		<!---
		PHP Code:
		
		--->
	</cffunction>
	
	<!---
	/**
	* Delete an Operation
	*
	* @param array $operations array of operation names
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* DeleteOperation(array('operation','...'));
	* ?>
	* </code>
	*/--->
	<cffunction name="DeleteOperation" access="public" output="no" returntype="any">
		<cfargument name="operations" type="array" required="yes" hint="an array of operation id's" />
		
		<!---
		PHP CODE:
		($operations=array())>
			/* Filter external variables */
			$operations = filter_var($operations, FILTER_SANITIZE_STRING, FILTER_REQUIRE_ARRAY);
			/* initialize variables */
			$sql = $key = $val = $query_success = $results = $operation = 
			$operation_locked = $operation_without_locked = '';
			/* Loop through the $objects array, retrieve all object_ids and delete all 
			associated objects */
			if (!empty($operations)) {
				/* Start transaction */
				  $query_success = TRUE;
				QueryEngine('', '', '', 1);
				/* Loop through the $operations array and deliver individual id's 
				to the SQL DELETE instruction */
				while (list ($key, $val) = each ($operations)) {
					$operation = (string) $val;
					$sql = 'SELECT name AS operation_name 
					FROM operation 
					WHERE name = ?';
					$results = QueryEngine($sql, array(&$operation), 's', 0);
					if (!empty($results)) {
						$operation_without_locked = (string) $results[0]['operation_name'];
					}
					$sql = 'SELECT name AS operation_name
					FROM operation 
					WHERE name = ? AND locked = 0';
					$results = QueryEngine($sql, array(&$operation), 's', 0);
					if (!empty($results)) {
						$operation_locked = (string) $results[0]['operation_name'];
					}
					/* If both SELECTS retrieve the same result the object is not
					locked and the DELETE can be executed */
					if (!empty($operation_without_locked) && !empty($operation_locked) && ($operation_without_locked == $operation_locked)) {
						$sql = 'DELETE FROM operation WHERE name = ?';
						$results = QueryEngine($sql, array(&$operation), 's', 0);
						if (!empty($results)) {
							$query_success = FALSE;
						}
					} else {
						$query_success = FALSE;
					}
				}
				/* Commit or rollback transaction based on the value of $query_success */
				if ($query_success) {
					/* Commit transaction, return true */
					QueryEngine('', '', '', 2);
					return TRUE;
				} else {
					/* Rollback transaction, return false */
					QueryEngine('', '', '', 3); 
					return FALSE;
				}
			}
			return FALSE;
			
			--->
	</cffunction>
</cfcomponent>