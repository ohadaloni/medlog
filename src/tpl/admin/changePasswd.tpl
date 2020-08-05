<form method="get" action="/medLog/updatePasswd">
	<table border="0">
		<tr class="medLogHeaderRow">
			<td colspan="2">Changeing Password for {$loginName}</td>
		</tr>
		<tr class="medLogRow">
			<td>Old Password</td>
			<td><input type="text" name="oldPasswd" size="30" /></td>
		</tr>
		<tr class="medLogRow">
			<td>New Password</td>
			<td><input type="text" name="newPasswd" size="30" /></td>
		</tr>
		<tr class="medLogRow">
			<td>New Password (again)</td>
			<td><input type="text" name="newPasswd2" size="30" /></td>
		</tr>
		<tr class="medLogRow">
			<td></td>
			<td><input type="submit" value="Update Password" /></td>
		</tr>
	</table>
</form>
