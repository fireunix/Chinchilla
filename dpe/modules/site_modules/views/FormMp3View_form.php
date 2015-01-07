

<div class="well"><center>
<h4>Скачать и заполнить заявку можно тут <a href="<?=base_url()?>uploads/zayavka.docx">Скачать</a></h3>
<?php echo form_open_multipart(base_url().$this->uri->segment(1)); ?>
<p> Ваша заявка <input type="file" name="portfolio" size="20" accept=".doc,.docx"/></p>
<p> Ваш Аудио файл<input type="file" name="mp3" size="20" accept=".mp3"/></p>
<br /><br />
<?php if(isset($error)) echo $error; ?>
<input type="submit" value="Загрузить" class="btn btn-success"/></center>
</form>
</div>