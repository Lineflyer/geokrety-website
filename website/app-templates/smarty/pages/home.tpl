{extends file='base.tpl'}

{block name=content}
<h2>{t}🎉 Welcome to GeoKrety.org!{/t}</h2>

<div class="row" id="welcome_intro">
  <div class="col-md-9">
    {include file='banners/site_intro.tpl'}
    {include file='banners/intro_stats.tpl'}
  </div>
  <div class="col-md-3">
    {include file='blocks/found_geokret.tpl'}
  </div>
</div>

<h2>{t}News{/t}</h2>
{foreach from=$news item=item}
{include file='elements/news.tpl'}
{/foreach}

{/block}


{block name=javascript}
{if IS_LOGGED_IN}
    // Bind modal
    {include 'js/news_subscription_modal.js.tpl'}
{/if}
{/block}
