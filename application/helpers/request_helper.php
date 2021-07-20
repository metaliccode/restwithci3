<?php

function ispost(){
    $method = $_SERVER['REQUEST_METHOD'];
    $instance =& get_instance();
    $defaulttokenheader = "123";
    $token = $instance->input->get_request_header('token');
    if($method=="POST"){
        if($token == $defaulttokenheader){
            return true;    
        }
        else{
            jsonoutput(401,array('status'=>'failed','message'=>'unauthorized'));
        }
        
    }
    else{
        jsonoutput(405,array('status'=>'failed','message'=>'method not allowed'));
    }
}

function jsonoutput($httpcode,$response){
    $instance =& get_instance();
    $instance->output->set_content_type('application/json');
    $instance->output->set_status_header($httpcode);
    $instance->output->set_output(json_encode($response));
}