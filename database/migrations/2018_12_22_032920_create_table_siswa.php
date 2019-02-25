<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableSiswa extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('siswa', function (Blueprint $table) {
        $table->increments('id_siswa', 10);
		$table->string('no_induk', 30);
		$table->char('nama_siswa', 30);
		$table->enum('kejuruan', ['RPL','MM']);
		$table->enum('jenis_kelamin', ['Laki-laki','Perempuan']);
		$table->string('token', 200);
        $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('siswa');
    }
}
