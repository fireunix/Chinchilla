<?if(!isset($other_js)) $other_js=""?>
<?if(!isset($other_css)) $other_css=""?>
<!DOCTYPE html>
<html lang="ru">
    <head>
<?=$meta?>
        <title>Звездный Сад > <?=$title?></title>
        <link href="<?= inc_ph_site() ?>css/bootstrap.min.css" rel="stylesheet">
        <link href="<?= inc_ph_site() ?>css/jumbotron.css" rel="stylesheet">
        <script src="<?= inc_ph_site() ?>js/ie-emulation-modes-warning.js"></script>
        <script src="<?= inc_ph_site() ?>js/ie10-viewport-bug-workaround.js"></script>
        <?=$other_css?>
        <!--[if lt IE 9]>
        <script src="js/ie8-responsive-file-warning.js"></script>
        <![endif]-->
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.min.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Навигация</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <center>
                        <ul class="nav navbar-nav">
                        <?=$menu?>
                        </ul>
                    </center>
                </div>
            </div>
        </div>

        <div class="jumbotron">
            <div class="container">
                <center>
                    <img src="<?= inc_ph_site() ?>img/logo.png">
                </center>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <?=$top?>
            </div>

           <?=$content?>
            <footer>
                <p>&copy; Stargarden 2014</p>
            </footer>
          <?=$time;?>
        </div>
        <script src="<?= inc_ph_site() ?>js/jquery.min.js"></script>
        <script src="<?= inc_ph_site() ?>js/bootstrap.min.js"></script>
        <?=$other_js?>
    </body>
</html>
