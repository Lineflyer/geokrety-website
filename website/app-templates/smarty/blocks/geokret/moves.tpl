{include file='macros/pagination.tpl'}
<a class="anchor" id="moves"></a>

{call pagination pg=$pg anchor='moves'}

{if $moves.subset}
{foreach from=$moves.subset item=item}
{include file='elements/move.tpl' move=$item}
{/foreach}
{else}

{if $geokret->isOwner()}
TODO: Hey! This GeoKret has not moved it. blablabla
{else}
TODO: Did you found this GeoKret? Log it!
{/if}

{/if}

{call pagination pg=$pg anchor='moves'}
