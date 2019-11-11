<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class Amahasiswa extends CI_Controller
{
	
	public function index ()
	{
		$data['mhs'] = $this->Mmahasiswa->ambilmhs();
		$this->load->view('TampilanMahasiswa',$data);
	}

	public function tambahmhs()
	{
		$this->load->view('Tambah');

	}

	public function editmhs($id)
	{
		$data['mhs'] = $this->Mmahasiswa->editambilmhs($id);
		$this->load->view('Edit',$data);	

	}
}
