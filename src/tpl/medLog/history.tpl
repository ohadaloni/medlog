<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td align="center" colspan="3">
				<h3>
					<a style="color:blue;"
						href="/medlog/history?description={$row0.description}&full=full&uniqueNumber={$uniqueNumber}#theEnd"
						title="click for full history"
					>{$row0.description}</a></h3>
			</td>
			<td align="center">
				<h3 style="color:blue;">{$row0.quantity}</h3>
			</td>
			<td align="center" colspan="3" id="stopWatch">
				{if $currentRow}
					{$currentRow.datetime|strtotime}
				{else}
					{$row0.datetime|strtotime}
				{/if}
			</td>
			<td align="center" colspan="2">
				{if $row0.noAlerts}
					<a href="/medlog/alert?description={$row0.description}"
						><img
							src="/images/red.png"
							title="(click to) alert me when due or missed"
						/></a>
				{else}
					<a href="/medlog/noAlert?description={$row0.description}"
						><img
							src="/images/green.png"
							title="on alert when due or missed (click to turn off)"
						/></a>
				{/if}
			</td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>#</td>
			<td>quantity</td>
			<td colspan="2">datetime</td>
			<td></td>
			<td>comments</td>
			<td colspan="3"></td>
		<tr>
		{foreach from=$rows key=key item=row}
			{assign var=No value=`$numRows-$key`}
			<tr class="medLogRow">
				<td>{$No}</td>
				<td>{$row.quantity}</td>
				<td>{$row.weekday}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td align="right">
					{$row.diff}
				</td>
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
		<tr class="medLogHeaderRow">
			<td align="center" colspan="3">
				<h3>
					<a style="color:blue;"
						href="/medlog/history?description={$row0.description}&full=full&uniqueNumber={$uniqueNumber}#theEnd"
						title="click for full history"
					>{$row0.description}</a></h3>
			</td>
			<td align="center">
				<h3 style="color:blue;">{$row0.quantity}</h3>
			</td>
			<td align="center" colspan="5">
			</td>
		</tr>
	</table>
</div>
<a name="theEnd"></a>
<br />
