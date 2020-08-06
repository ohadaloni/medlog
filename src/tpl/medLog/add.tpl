<br />
<div class="container">
	<form method="get" action="/medLog/insert">
		<table>
			<tr class="medLogRow">
				<td>
					Description
				</td>
				<td>
					<input type="text" name="description" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					Quantity
				</td>
				<td>
					<input type="text" name="quantity" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					comments
				</td>
				<td>
					<textarea cols="80" rows="4" name="comments"></textarea>
				</td>
			</tr>
			<tr class="medLogRow">
				<td colspan="2">
					<button class="btn btn-large btn-primary" type="submit">New Med</button>
				</td>
			</tr>
		</table>
	</form>
</div>
