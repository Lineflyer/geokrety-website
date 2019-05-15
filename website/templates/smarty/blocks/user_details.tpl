<div class="panel panel-default">
  <div class="panel-heading">
    {call gk_icon gk_type=2}
    {userlink user=$user}
    <div class="pull-right">
      {if $user->email}
      <a class="btn btn-primary btn-xs" href="/majluj.php?to={$user->id}" title="{t}Send a message to the user{/t}">
        {fa icon="envelope"}
      </a>
      {/if}
      <a class="btn btn-warning btn-xs" href="/georss.php?userid={$user->id}" title="{t}Subscribe to RSS channel{/t}">
        {fa icon="rss"}
      </a>
      {if $user->isCurrentUser()}
      <a class="btn btn-info btn-xs" href="/edit.php?co=haslo" title="{t}Password change{/t}">
        {fa icon="key"}
      </a>
      {/if}
    </div>
    <div class="clearfix"></div>
  </div>
  <div class="panel-body">

    <div class="pull-left">
      <dl class="dl-horizontal">
        <dt>{t}Joined us{/t}</dt>
        <dd>{Carbon::parse($user->joinDate)->diffForHumans()}</dd>
        <dt>{t}Language{/t}</dt>
        <dd>
          {$user->language}
          {if $user->isCurrentUser() }
          <div class="btn-group pull-right" role="group">
            <button type="button" class="btn btn-warning btn-xs" title="{t}Choose prefered language{/t}" data-toggle="modal" data-target="#modal" data-type="user-choose-language">
              {fa icon="pencil"}
            </button>
          </div>
          {/if}
        </dd>
        {if $user->isCurrentUser()}
        <dt>{t}Email{/t}</dt>
        <dd>
          {if $user->email}
          {$user->email}
          {else}
          <em>{t}No email address, please add one!{/t}</em>
          {/if}
          <div class="btn-group pull-right" role="group">
            <button type="button" class="btn btn-warning btn-xs" title="{t}Update email address{/t}" data-toggle="modal" data-target="#modal" data-type="user-update-email">
              {fa icon="pencil"}
            </button>
          </div>
        </dd>
        <dt>{t}Secid{/t}</dt>
        <dd>
          <div class="input-group">
            <input class="form-control input-sm" type="text" id="secid" value="{$user->secid}" title="{t}Used to authenticate in other applications. Keep it secret!{/t}" readonly>
            <a class="btn btn-warning btn-xs input-group-addon" href="" title="{t}Generate a new secid{/t}" data-toggle="modal" data-target="#modal" data-type="secid-refresh">
              {fa icon="refresh"}
            </a>
          </div>
        </dd>
        {/if}
      </dl>

      {t escape=no}To change your username or remove your account? Send us <a href="/kontakt.php">an email</a>!{/t}
    </div>

    <div class="gallery pull-right">
      {pictureOrDefault item=$user->avatar() skipLinkToEntity=true isOwner=$user->isCurrentUser()}
    </div>
    <div class="clearfix"></div>
  </div>


</div>