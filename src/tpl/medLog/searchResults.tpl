<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td colspan="2">Last Taken</td>
		<tr>
		{foreach from=$rows key=key item=row}
			<tr class="medLogRow">
				<td>
					<a 
						style="color:blue;"
						href="/medlog/history?description={$row.description}">{$row.description}</a>
				</td>
				<td>{$row.maxDate}</td>
				<td>{$row.quantity}</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
