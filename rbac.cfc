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
	
	A note from the author 
	
	If you use this code in your project, please let me know so I can get a feel for what kinds ways people are utilizing this tool.
	
	Sincerely,
	Joshua F. Rountree
	
	--->
	
	<cffunction name="init" access="public" returntype="rbac" hint="instantiates the rbac system">
		<cfargument name="datasource" type="string" required="yes">
		<cfargument name="tableprefix" type="string" required="no" hint="default is 'ac_'" default="ac_">
		<cfargument name="dbms" type="string" required="yes" hint="database type (mysql, mssql, etc.)">
		
		<cfset variables.dsn = arguments.datasource />
		<cfset variables.prefix = arguments.tableprefix />
		<cfset variables.dbtype = arguments.dbms />
		
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
	<cffunction AddUser($user='', $password='', $first_name='', $family_name='', $email='')>
	
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
	* Example:
	* <code>
	* <?php
	* DeleteUser(array('username','username', '...'))
	* ?>
	* </code>
	*/--->
	<cffunction DeleteUser($users=array())>
	
	</cffunction>
	
	
	<!---
	/**
	* This command creates a new role. 
	* The command is valid if and only if the new 
	* role is not already a member of the ROLES data set. The ROLES data set and 
	* the functions assigned_users and assigned_permissions are updated. Initially,
	* no user or permission is assigned to the new role. 
	*
	* @param string $role role name
	* @return boolean
	*
	* Example:
	* <code>
	* <?php
	* AddRole('role');
	* ?>
	* </code>
	*/--->
	<cffunction AddRole($role='')>
	
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
	<cffunction DeleteRole($roles=array())>
	
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
	<cffunction AssignUser($user='', $roles=array())>
	
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
	<cffunction DeassignUser($user='', $roles=array())>
	
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
	<cffunction GrantPermission($permission=array(), $role='')>
	
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
	<cffunction RevokePermission($permission=array(), $role='')>
	
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
	* @param string $user username
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
	<cffunction CreateSession($user='', $session='')>
	
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
	<cffunction DeleteSession($sessions)>
	
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
	<cffunction AddActiveRole($user='', $session='', $roles=array())>
	
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
	<cffunction DropActiveRole($user='', $session='', $roles=array())>
	
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
	<cffunction CheckAccess($session='', $object='', $operation='')>
	
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
	<cffunction AssignedUsers($role='')>
	
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
<cffunction AssignedRoles($user='')>
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
}
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
<cffunction RolePermissions($role='')>
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
}
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
<cffunction UserPermissions($user='')>
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
    return QueryEngine($sql, array(&$user), 's', 0);
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
<cffunction SessionRoles($session='')>
    /* Filter input */
    $session = filter_var($session, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_HIGH|FILTER_FLAG_ENCODE_LOW);
    /* Select all roles that are associated with the active session */
    $sql = 'SELECT DISTINCT role.name AS Role
    FROM role
    INNER JOIN session_role USING (role_id)
    INNER JOIN session USING (session_id)
    WHERE session.name = ?';
    return QueryEngine($sql, array(&$session), 's', 0);
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
<cffunction SessionPermissions($session='')>
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
*/
function AddPermission($permission='', $object='', $operation='') {
--->

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
*/
function DeletePermission($permissions=array()) {
    
--->

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
*/
function AddObject($object='', $locked=0) {
   
--->


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
*/
function DeleteObject($objects=array()) {
    
--->


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
*/
function AddOperation($operation='', $mask='', $locked=0) {
    
--->


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
*/
function DeleteOperation($operations=array()) {
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
}
--->


<!---
/**
*
* END OF NON STANDARD API CALLS
*
*/
--->
</cfcomponent>