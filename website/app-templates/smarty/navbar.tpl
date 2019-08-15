<nav class="navbar-inverse navbar-fixed-top">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                <span class="sr-only">{t}Toggle navigation{/t}</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{'home'|alias}">GeoKrety.org</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="{'home'|alias}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> {t}Home{/t}</a></li>
                <li><a href="{'news_list'|alias}">{fa icon="newspaper-o"} {t}News{/t}</a></li>
                <li><a href="ruchy.php"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> {t}Log a GeoKret{/t}</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{fa icon="cogs"} {t}Actions{/t} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="ruchy.php"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> {t}Log a GeoKret{/t}</a></li>
{if $f3->get('SESSION.IS_LOGGED_IN')}
                        <li><a href="{'geokret_create'|alias}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> {t}Create a new GeoKret{/t}</a></li>
                        <li><a href="claim.php"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> {t}Claim a GeoKret{/t}</a></li>
{/if}
                        <li role="separator" class="divider"></li>
                        <li><a href="szukaj.php"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> {t}Advanced search{/t}</a></li>
                        <li><a href="galeria.php"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span> {t}Photo gallery{/t}</a></li>
                    </ul>
                </li>
                {capture name="mapParameters"}
                {if $f3->get('SESSION.IS_LOGGED_IN') and isset($user) and isset($user->lat) and isset($user->lon) and empty($user->lat) and empty($user->lon)}
                #11/{$user->lat}/{$user->lon}/1/1/0/0/90/
                {else}
                {GK_MAP_DEFAULT_PARAMS}
                {/if}
                {/capture}
                <li><a href="gkmap.php{$smarty.capture.mapParameters}">{fa icon="map"} {t}GeoKrety Map{/t}</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <img src="{GK_CDN_ICONS_URL}/language.svg" width="14" />
                        {t}Language{/t}
                        <small title="{t}Currently selected language{/t}">({LANGUAGE})</small>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        {foreach $languages as $code => $lang}
                        <li><a href="/{$code}">{$lang}</a></li>
                        {/foreach}
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{fa icon="support"} {t}Help{/t} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="{'help'|alias}">{fa icon="support"} {t}Help{/t}</a></li>
                        <li><a href="{'mole_holes'|alias}">{fa icon="bed"} {t}Moleholes and GK hotels{/t}</a></li>
                        <li><a href="{'terms_of_use'|alias}">{fa icon="legal"} {t}Terms of use{/t}</a></li>
                        <li><a href="{'press_corner'|alias}">{fa icon="newspaper-o"} {t}Press corner{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="{'help_api'|alias}">{fa icon="cog"} {t}GK interface / API{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="{'statistics'|alias}">{fa icon="bar-chart"} {t}Statistics{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="{'work_in_progress'|alias}">{fa icon="download"} {t}Downloads{/t}</a></li>
                        <li><a href="{'work_in_progress'|alias}">{fa icon="cog"} {t}GeoKrety Toolbox{/t}</a></li>
                        <li><a href="go2geo/">{fa icon="map-pin"} {t}Waypoint resolver{/t}</a></li>
                    </ul>
                </li>
                {if $f3->get('SESSION.IS_LOGGED_IN')}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        {t}My account{/t} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="mypage.php"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> {t}My details{/t}</a></li>
                        {if isset($isSuperUser) and $isSuperUser}
                        <li><a href="_admin.php">{fa icon="support"} {t}Admin{/t}</a></li>
                        {/if}
                        <li role="separator" class="divider"></li>
                        <li><a href="mypage.php?co=5">{fa icon="briefcase"} {t}My inventory{/t}</a></li>
                        <li><a href="mypage.php?co=1">{fa icon="bolt"} {t}My GeoKrety{/t}</a></li>
                        <li><a href="mypage.php?co=2">{fa icon="binoculars"} {t}Watched GeoKrety{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="mypage.php?co=3">{fa icon="plane"} {t}My recent logs{/t}</a></li>
                        <li><a href="mypage.php?co=4">{fa icon="plane"} {t}Recent moves of my GeoKrety{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="galeria.php?f=myown">{fa icon="picture-o"} {t}My photos{/t}</a></li>
                        <li><a href="galeria.php?f=mygeokrets">{fa icon="picture-o"} {t}Photos of my GeoKrety{/t}</a>

                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="gkmap.php{GK_MAP_DEFAULT_PARAMS}{$user->username}">{fa icon="map"} {t}Where are my GeoKrety?{/t}</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="{'logout'|alias}">{fa icon="sign-out"} {t}Sign out{/t}</a></li>
                    </ul>
                </li>
                {else}
                <li><a href="adduser.php">{fa icon="user-plus"} {t}Create account{/t}</a></li>
                <li><a href="{'login'|alias}">{fa icon="sign-in"} {t}Sign in{/t}</a>

                    <button type="button" class="btn btn-default btn-xs" title="{t}Login{/t}" data-toggle="modal" data-target="#modal" data-type="login">
                        {fa icon="bell-slash"}
                    </button></li>
                {/if}
            </ul>


        </div>




    </div>
</nav>