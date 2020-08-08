<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td colspan="2">Last Taken</td>
			<td>Quantity</td>
			<td>Taking Now</td>
			<td>History</td>
		<tr>
		{foreach from=$rows key=key item=row}
			<tr class="medLogRow">
				<td>{$row.description}</td>
				<td>{$row.weekday}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td>{$row.quantity}</td>
				<td>
					<a href="/medLog/insert?description={$row.description}&quantity={$row.quantity}"><img
						src="/images/go.png"
						title="Taking Now"
					/></a>
				</td>
				<td align="right">
					<a href="/medLog/history?description={$row.description}"><img
						src="/images/list.png"
						title="History"
					/></a>
					({$row.cnt})
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
