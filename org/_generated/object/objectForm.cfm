<form action="<cfoutput>#xfa.frmSubmit#</cfoutput>" method="post" class="" ><input type="hidden" name="objectID" value="<cfoutput>#objectID#</cfoutput>" /><div class="req"><b>*</b> Indicates required field</div><cfoutput><h3>Form title here</h3><fieldset><legend>Section Legend<legend><div class="notes">	<h4>object Info</h4></div>	<div>	<label for="name"><em>*</em>name:</label>	<input id="name" name="name" type="text" class="inputText" value="#objectBean.getname()#"  />	</div>	<div>	<label for="description">description:</label>	<input id="description" name="description" type="text" class="inputText" value="#objectBean.getdescription()#"  />	</div>	<div>	<label for="locked">locked:</label>	<input id="locked" name="locked" type="text" class="inputText" value="#objectBean.getlocked()#"  />	</div>	<br />	<div class="">		<input type="submit" value="Submit" class="" /><br />	</div></fieldset></cfoutput></form>
