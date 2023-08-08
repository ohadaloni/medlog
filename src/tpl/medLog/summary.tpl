<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td align="center" colspan="3"><h3>{$row0.description}</h3></td>
			<td align="right" id="stopWatch">{$row0.datetime|strtotime}</td>
			<td><h3>{$row0.quantity}</h3></td>
			<td colspan="3"></td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td colspan="2">Last Taken</td>
			<td>Ago</td>
			<td>Quantity</td>
			<td>Taking</td>
			<td colspan="2">History</td>
		<tr>
		{foreach from=$rows key=key item=row}
			<tr class="medLogRow">
				<td>
					<a title="{$row.historyText}" style="color:black;">{$row.description}</a>
				</td>
				<td>{$row.weekday}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td align="right">{$row.ago}</td>
				<td>{$row.quantity}</td>
				<td>
					<a href="/medLog/insert?description={$row.description|urlencode}&quantity={$row.quantity|urlencode}"><img
						src="/images/go.png"
						title="Taking Now"
					/></a>
				</td>
				<td>
					<a href="/medLog/history?description={$row.description|urlencode}"><img
						src="/images/list.png"
						title="History"
					/></a>
				</td>
				<td align="right">
					({$row.cnt})
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
