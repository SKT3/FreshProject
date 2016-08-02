<?php $this->title = 'Register New User'; ?>

<h1><?= htmlspecialchars($this->title) ?></h1>

<form class="cool" method="post">
    <div><label for="username">Username: </label> </div>
    <input id="username" type="text" name="username"/>
    <div><label for="password">Password: </label> </div>
    <input id="password" type="password" name="password"/>
    <div><label for="username">Full Name: </label> </div>
    <input id="full_name" type="text" name="full_name"/>

    <div><input type="submit" value="Register"/>
        <a href="login">[Go to Login]</a> </div>
</form>
