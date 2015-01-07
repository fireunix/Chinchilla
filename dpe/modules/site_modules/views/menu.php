<? foreach($lists as $row):?>
<li><a href="<?= $row['link']; ?>"><?= $row['name'] ?></a></li>
<?endforeach;?>