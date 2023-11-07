<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Professeur;
use App\Models\Formation;
use App\Models\Fichier;

class Matiere extends Model
{
    use HasFactory;

    protected $fillable = [
        'nomMatiere'
    ];

    public function professeurs(){
        return $this->belongsToMany(Professeur::class);
    }

    public function formations(){
        return $this->belongsToMany(Formation::class);
    }

    public function fichier(){
        return $this->hasMany(Fichier::class);
    }

    public function scopeFilter($query, array $filters)
    {
        if ($filters['nomMatiere'] ?? false) {
            $query->where('nomMatiere', 'like', '%' . $filters['nomMatiere'] . '%');
        }

        if ($filters['search'] ?? false) {
            $query->where('nomMatiere', 'like', '%' . $filters['search'] . '%');
        }
    }
}
