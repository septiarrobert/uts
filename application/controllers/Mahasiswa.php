<?php 


class Mahasiswa extends CI_Controller{

	public function tambahmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');


		if (!$this->form_validation->run()==false) {
			$this->Mmahasiswa->tambah_mhs();
			redirect('Amahasiswa/');
		}else {
			redirect('Amahasiswa/tambahmhs');
		}
	}
	public function editmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');

		if ($this->form_validation->run()!=false) {
			$this->Mmahasiswa->edit_mhs();
			redirect('Amahasiswa');
		}else{
			redirect('Amahasiswa/editmhs');
		}
	}

	public function hapusmhs($id) {
		if ($id != ""){
			$this->Mmahasiswa->hapus_mhs($id);
			redirect('Amahasiswa');
		}else{
			redirect('Amahasiswa');
		}
	}
	
}

