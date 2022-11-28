<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td align="center" colspan="7">Lately</td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td>quantity</td>
			<td>time</td>
			<td>comments</td>
			<td colspan="3"></td>
		<tr>
		{foreach from=$rows key=key item=row}
			{if $row.date != $lastDate}
				<tr>
					<td colspan="7" align="center" style="background-color:#bbb;">
						{$row.weekday} {$row.date}
					</td>
				</tr>
			{/if}
			{assign var=lastDate value=$row.date}
			<tr class="medLogRow">
				<td>{$row.description}</td>
				<td>{$row.quantity}</td>
				<td>{$row.datetime|substr:10:6}</td>
				<td>{$row.comments|makeLinks|nl2br}</td>
				<td>
					<a href="/medLog/insert?description={$row.description|urlencode}&quantity={$row.quantity|urlencode}"><img
						src="/images/go.png"
						title="Taking {$row.quantity} Now"
					/></a>
				</td>
				<td>
					<a href="/medLog/edit?description={$description|urlencode}&id={$row.id}"><img
						src="/images/edit.png"
						title="Edit"
					/></a>
				</td>
				<td>
					<form action="/medLog/remove">
						<input type ="checkbox" name="ok" />
						<input type ="hidden" name="id" value="{$row.id}" />
						<input type ="hidden" name="description" value="{$description}" />
						<input type="image" src="/images/delete.png" title="check the box to confirm deletion" />
					</form>
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
