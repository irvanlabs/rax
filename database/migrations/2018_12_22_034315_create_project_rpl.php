<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectRpl extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_rpl', function (Blueprint $table) {
        	$table->increments('id_project', 10);
		$table->char('nama_siswa', 30);
		$table->char('nama_project', 30)->unique();
		$table->string('category', 15);
		$table->text('description');
		$table->string('picture', 50);
		$table->string('repo_url', 30);
		$table->integer('submited');
		$table->integer('verified');
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
        Schema::dropIfExists('project_rpl');
    }
}
