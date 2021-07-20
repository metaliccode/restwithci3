<?php

class Api extends CI_Controller{

    function login(){
        if(ispost()){
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $checkuser = $this->db->query("select * from users where username='$username'");
            $numrows = $checkuser->num_rows();
            if($numrows>0){
                $checkpassword = password_verify($password,$checkuser->row()->password);
                if($checkpassword){
                    $response = array(
                        'status'=>'success',
                        'message'=>'Login Sukses',
                        'isLogin'=>true,
                        'userid'=>$checkuser->row()->userid,
                        'username'=>$checkuser->row()->username,
                        'fullname'=>$checkuser->row()->fullname,
                    );
                    jsonoutput(200,$response);
                }
                else{
                    jsonoutput(200,array('status'=>'failed','message'=>'Password tidak sesuai'));
                }
            }
            else{
                jsonoutput(200,array('status'=>'failed','message'=>'user tidak ditemukan'));
            }
        }
    }

    function passwordgenerator(){
        echo password_hash("123",PASSWORD_BCRYPT);
    }

    function getallproducts(){
        $imagepath = base_url('images/');
        $q = "select productid,productname,productprice,
            concat('$imagepath',productimage) as productimage from products";
        $exec = $this->db->query($q);
        $response = array(
            'status'=>'success',
            'message'=>'Query OK',
            'rows'=>$exec->num_rows(),
            'products'=>$exec->result()
        );
        jsonoutput(200,$response);
    }

    function deleteproduct(){
        if(ispost()){
            $productid = $this->input->post('productid');
            $delete = $this->db->delete('products',array('productid'=>$productid));
            if($delete){
                jsonoutput(200,array('status'=>'success','message'=>"$productid Berhasil Dihapus"));
            }
            else{
                jsonoutput(200,array('status'=>'failed','message'=>"$productid Gagal Dihapus"));
            }
        }
    }

    function addproduct(){
        if(ispost()){
            $productname = $this->input->post('productname');
            $productprice = $this->input->post('productprice');
            $config['upload_path'] = './images/';
            $config['allowed_types'] = 'jpg|jpeg|png';
            $config['encrypt_name'] = true;
            $this->load->library('upload',$config);
            if($this->upload->do_upload('productimage')){
                $data = array('upload_data'=>$this->upload->data());
                $newproduct = array(
                    'productname'=>$productname,
                    'productprice'=>$productprice,
                    'productimage'=>$data['upload_data']['file_name']
                );
                $insert = $this->db->insert('products',$newproduct);
                if($insert){
                    jsonoutput(200,array('status'=>'success','message'=>"$productname Berhasil Disimpan"));
                }
                else{
                    jsonoutput(200,array('status'=>'failed','message'=>"$productname Gagal Disimpan"));
                }
            }
            else{
                $error = $this->upload->display_errors();
                jsonoutput(200,array('status'=>'failed','message'=>"$productname Gagal Disimpan, $error"));
            }
        }
        
    }

}