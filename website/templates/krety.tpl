<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>GeoKrety: {$title}</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="{$cdnUrl}/libraries/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="{$cssUrl}/krety-v2.css" media="screen" />
  <link rel="stylesheet" href="{$cssUrl}/flag-icon.min.css" media="screen" />
  <link rel="stylesheet" href="{$cdnUrl}/libraries/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="apple-touch-icon" sizes="180x180" href="{$imagesUrl}/favicon/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="{$imagesUrl}/favicon/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="{$imagesUrl}/favicon/favicon-16x16.png" />
  <link rel="manifest" href="{$imagesUrl}/favicon/manifest.json" />
  <link rel="mask-icon" href="{$imagesUrl}/favicon/safari-pinned-tab.svg" color="#5bbad5" />
  <link rel="shortcut icon" href="{$imagesUrl}/favicon/favicon.ico" />
  <meta name="msapplication-config" content="{$imagesUrl}/favicon/browserconfig.xml" />
  <meta name="theme-color" content="#ffffff" />
</head>

<body>
  <header>
    <p class="logo"><a href="/">Geo<span class="black">Krety</span>.org</a></p>
    <p class="subline">Open source item tracking for all caching platforms</p>
    <span class="bg"></span>
    <img class="sun" src="{$imagesUrl}/header/sun.svg">
  </header>

  <div class="container">
    {if count($alert_msgs)}
      {foreach from=$alert_msgs item=alert_msg}
        <div class="alert alert-{$alert_msg.level} alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="{t}Close{/t}"><span aria-hidden="true">&times;</span></button>
          {$alert_msg.message}
        </div>
      {/foreach}
    {/if}

    {$content}
    {if $content_template}
      {include file=$content_template}
    {/if}
  </div>
  {include file='footer.tpl'}

{ if not IS_PROD }
  <div class="alert alert-danger" role="alert">
  <b>{t escape=no}This is not the production instance. If you are not a tester, then you probably whish to go to our <a href="https://geokrety.org">production website</a>.{/t}</b>
  </div>
{/if}
  {include file='navbar.tpl'}

  <script type="text/javascript" src="{$cdnUrl}/libraries/jquery/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="{$cdnUrl}/libraries/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="{$cdnUrl}/libraries/moment.js/2.22.0/moment.min.js"></script>
  <script type="text/javascript" src="{$cdnUrl}/libraries/bootstrap-maxlength/1.7.0/bootstrap-maxlength.min.js"></script>
  <script type="text/javascript">
    {literal}
    (function($) {
      $(document).ready(function() {
        $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
          event.preventDefault();
          event.stopPropagation();
          $(this).parent().siblings().removeClass('open');
          $(this).parent().toggleClass('open');
        });
      });
    })(jQuery);
    {/literal}
  </script>
</body>

</html>