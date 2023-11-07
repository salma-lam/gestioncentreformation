<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('matiere_professeurs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('matiere_id');
            $table->unsignedBigInteger('professeur_id');        
            $table->foreign('matiere_id')->references('id')->on('matieres');
            $table->foreign('professeur_id')->references('id')->on('professeurs');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('matiere_professeurs');
    }
};
