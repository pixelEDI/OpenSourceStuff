<!DOCTYPE html>
<html lang="en" dir="ltr">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" content="noindex">
<title>Export: magicstuff - mariadb_server - Adminer</title>
<link rel="stylesheet" type="text/css" href="?file=default.css&amp;version=4.8.1">
<script src='?file=functions.js&amp;version=4.8.1' nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q="></script>
<link rel="shortcut icon" type="image/x-icon" href="?file=favicon.ico&amp;version=4.8.1">
<link rel="apple-touch-icon" href="?file=favicon.ico&amp;version=4.8.1">

<body class="ltr nojs">
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">
mixin(document.body, {onkeydown: bodyKeydown, onclick: bodyClick});
document.body.className = document.body.className.replace(/ nojs/, ' js');
var offlineMessage = 'You are offline.';
var thousandsSeparator = ',';
</script>

<div id="help" class="jush-sql jsonly hidden"></div>
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">mixin(qs('#help'), {onmouseover: function () { helpOpen = 1; }, onmouseout: helpMouseout});</script>

<div id="content">
<p id="breadcrumb"><a href="?server=mariadb_server">MySQL</a> &raquo; <a href='?server=mariadb_server&amp;username=pixeledi' accesskey='1' title='Alt+Shift+1'>mariadb_server</a> &raquo; <a href="?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff">magicstuff</a> &raquo; Export
<h2>Export: magicstuff</h2>
<div id='ajaxstatus' class='jsonly hidden'></div>

<form action="" method="post">
<table cellspacing="0" class="layout">
<tr><th>Output<td><label><input type='radio' name='output' value='text' checked>open</label><label><input type='radio' name='output' value='file'>save</label><label><input type='radio' name='output' value='gz'>gzip</label>
<tr><th>Format<td><label><input type='radio' name='format' value='sql' checked>SQL</label><label><input type='radio' name='format' value='csv'>CSV,</label><label><input type='radio' name='format' value='csv;'>CSV;</label><label><input type='radio' name='format' value='tsv'>TSV</label>
<tr><th>Database<td><select name='db_style'><option selected><option>USE<option>DROP+CREATE<option>CREATE</select><label><input type='checkbox' name='routines' value='1'>Routines</label><label><input type='checkbox' name='events' value='1'>Events</label><tr><th>Tables<td><select name='table_style'><option><option selected>DROP+CREATE<option>CREATE</select><label><input type='checkbox' name='auto_increment' value='1'>Auto Increment</label><label><input type='checkbox' name='triggers' value='1' checked>Triggers</label><tr><th>Data<td><select name='data_style'><option><option>TRUNCATE+INSERT<option selected>INSERT<option>INSERT+UPDATE</select></table>
<p><input type="submit" value="Export">
<input type="hidden" name="token" value="720048:834284">

<table cellspacing="0">
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">qsl('table').onclick = dumpClick;</script>
<thead><tr><th style='text-align: left;'><label class='block'><input type='checkbox' id='check-tables'>Tables</label><script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">qs('#check-tables').onclick = partial(formCheck, /^tables\[/);</script><th style='text-align: right;'><label class='block'>Data<input type='checkbox' id='check-data'></label><script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">qs('#check-data').onclick = partial(formCheck, /^data\[/);</script></thead>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='iot_sensors' checked>iot_sensors</label><td align='right'><label class='block'><span id='Rows-iot_sensors'></span><input type='checkbox' name='data[]' value='iot_sensors' checked></label>
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">ajaxSetHtml('?server=mariadb_server&username=pixeledi&db=magicstuff&script=db');</script>
</table>
</form>
</div>

<form action='' method='post'>
<div id='lang'>Language: <select name='lang'><option value="en" selected>English<option value="ar">العربية<option value="bg">Български<option value="bn">বাংলা<option value="bs">Bosanski<option value="ca">Català<option value="cs">Čeština<option value="da">Dansk<option value="de">Deutsch<option value="el">Ελληνικά<option value="es">Español<option value="et">Eesti<option value="fa">فارسی<option value="fi">Suomi<option value="fr">Français<option value="gl">Galego<option value="he">עברית<option value="hu">Magyar<option value="id">Bahasa Indonesia<option value="it">Italiano<option value="ja">日本語<option value="ka">ქართული<option value="ko">한국어<option value="lt">Lietuvių<option value="ms">Bahasa Melayu<option value="nl">Nederlands<option value="no">Norsk<option value="pl">Polski<option value="pt">Português<option value="pt-br">Português (Brazil)<option value="ro">Limba Română<option value="ru">Русский<option value="sk">Slovenčina<option value="sl">Slovenski<option value="sr">Српски<option value="sv">Svenska<option value="ta">த‌மிழ்<option value="th">ภาษาไทย<option value="tr">Türkçe<option value="uk">Українська<option value="vi">Tiếng Việt<option value="zh">简体中文<option value="zh-tw">繁體中文</select><script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">qsl('select').onchange = function () { this.form.submit(); };</script> <input type='submit' value='Use' class='hidden'>
<input type='hidden' name='token' value='1012269:603249'>
</div>
</form>
<form action="" method="post">
<p class="logout">
<input type="submit" name="logout" value="Logout" id="logout">
<input type="hidden" name="token" value="720048:834284">
</p>
</form>
<div id="menu">
<h1>
<a href='https://www.adminer.org/' target="_blank" rel="noreferrer noopener" id='h1'>Adminer</a> <span class="version">4.8.1</span>
<a href="https://www.adminer.org/#download" target="_blank" rel="noreferrer noopener" id="version"></a>
</h1>
<script src='?file=jush.js&amp;version=4.8.1' nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q="></script>
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">
var jushLinks = { sql: [ '?server=mariadb_server&username=pixeledi&db=magicstuff&table=$&', /\b(iot_sensors)\b/g ] };
jushLinks.bac = jushLinks.sql;
jushLinks.bra = jushLinks.sql;
jushLinks.sqlite_quo = jushLinks.sql;
jushLinks.mssql_bra = jushLinks.sql;
bodyLoad('11', true);
</script>
<form action="">
<p id="dbs">
<input type="hidden" name="server" value="mariadb_server"><input type="hidden" name="username" value="pixeledi"><span title='database'>DB</span>: <select name='db'><option value=""><option>information_schema<option selected>magicstuff</select><script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">mixin(qsl('select'), {onmousedown: dbMouseDown, onchange: dbChange});</script>
<input type='submit' value='Use' class='hidden'>
<input type='hidden' name='dump' value=''></p></form>
<p class='links'><a href='?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;sql='>SQL command</a>
<a href='?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;import='>Import</a>
<a href='?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;dump=' id='dump' class='active '>Export</a>
<a href="?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;create=">Create table</a>
<ul id='tables'><script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">mixin(qs('#tables'), {onmouseover: menuOver, onmouseout: menuOut});</script>
<li><a href="?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;select=iot_sensors" class='select' title='Select data'>select</a> <a href="?server=mariadb_server&amp;username=pixeledi&amp;db=magicstuff&amp;table=iot_sensors" class='structure' title='Show structure'>iot_sensors</a>
</ul>
</div>
<script nonce="ZmVmMmZkYTQ5OTVmYTk4MWY1NzVmYmYzY2RhNTcyY2Q=">setupSubmitHighlight(document);</script>
