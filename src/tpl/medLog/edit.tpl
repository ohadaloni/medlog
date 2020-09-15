<div class="container">
	<form method="get" action="/medLog/update">
		<table>
			<tr class="medLogHeaderRow">
				<td colspan="2">
					Change a medLog row
					<a href="/medlog" title="medlog"><img
						src="/images/drillup.png"
					/></a>
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					Description
				</td>
				<td>
					<input type="text" name="description" value="{$row.description}" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					Quantity
				</td>
				<td>
					<input type="text" name="quantity" value="{$row.quantity}" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					date
				</td>
				<td>
					<input type="date" name="date" value="{$row.date}" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					time
				</td>
				<td>
					<input type="time" name="time" value="{$row.hm}" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					comments
				</td>
				<td>
					<textarea cols="80" rows="5" name="comments">{$row.comments}</textarea>
				</td>
			</tr>
			<tr class="medLogRow">
				<td colspan="2">
					<input type="hidden" name="id" value="{$row.id}" />
					<button class="btn btn-large btn-primary" type="submit">Update</button>
				</td>
			</tr>
		</table>
	</form>
</div>
