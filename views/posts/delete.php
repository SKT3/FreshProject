<?php $this->title = 'Delete post';?>
<h1>Are u sure u want to delete this post?</h1>
<form method="post">
    <div>Title:</div><input type="text" disabled value="<?=htmlspecialchars($this->post['title'])?>"/>
    <div>Content</div>
    <textarea rows="10" disabled><?=
        htmlspecialchars($this->post['content'])?></textarea>
    <div>Date:</div><input type="text" disabled value="<?=
        htmlspecialchars($this->post['date'])?>" />
    <div>Author ID:</div><input type="text" value="<?=
        htmlspecialchars($this->post['user_id'])?>" disabled/>
    <div><input type="submit" value="Delete"/><a href="<?=APP_ROOT?>/posts" </a></div>
</form>
