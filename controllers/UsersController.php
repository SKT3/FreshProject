<?php

class UsersController extends BaseController
{
    public function register()
    {
        if($this->isPost){
            $username = $_POST['username'];
            if (strlen($username)<2 || strlen($username)>50){
                $this->setValidationError("username" , "Invalid Username");
            }
            $password =$_POST['password'];
            if (strlen($password)<2 || strlen($password)>50){
                $this->setValidationError("password" , "Invalid Password");
            }
            $full_name = $_POST['full_name'];
           if (strlen($full_name)>200){
               $this->setValidationError("full_name" , "Invalid Full Name");
           }
            if($this->formValid()){
                $userId = $this->model->register($username,$password,$full_name);
                $_SESSION['username'] = $username;
                $_SESSION['user_id'] = $userId;
                $this->addInfoMessage("Registration successful");
                $this->redirect("posts");
            }else{
                $this->addErrorMessage("User Registration Failed!");
            }
        }
    }

    public function login()
    {
        if ($this->isPost) {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $loggedUserId = $this->model->login($username, $password);
            if ($loggedUserId) {
                $_SESSION['username'] = $username;
                $_SESSION['user_id'] = $loggedUserId;
                $this->addInfoMessage("Login successful");
                return $this->redirect("posts");
            } else {
                $this->addErrorMessage("Login Failed");
            }
        }
    }

    public function index(){
       $this->authorize();
        $this->users = $this->model->getUsers();
    }

    public function logout()
    {
        session_destroy();
        $this->addInfoMessage("Logout Successful");
        $this->redirect("");
    }
}
