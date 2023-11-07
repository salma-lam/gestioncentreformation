<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Matiere;
use App\Models\GroupeFormation;


class Fichier extends Model
{
    use HasFactory;
 
    protected $fillable = [
        'type',
        'fichier',
        'video',
        'titre',
        'matiere_id'
    ];

    public function matiere(){
        return $this->belongsTo(Matiere::class,'matiere_id');
    }

    public function groupeFormation(){
        return $this->belongsTo(GroupeFormation::class);
    }

    public function scopeFilter($query, array $filters)
    {
        if ($filters['titre'] ?? false) {
            $query->where('titre', 'like', '%' . $filters['titre'] . '%');
        }

        if ($filters['search'] ?? false) {
            $searchTerm = '%' . $filters['search'] . '%';
            $query->where(function ($query) use ($searchTerm) {
                $query->where('titre', 'like', $searchTerm);
            });
        }
    }
}


