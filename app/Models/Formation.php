<?php
 
namespace App\Models;
 
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Matiere;
use App\Models\GroupeFormation;
use App\Models\Etudiant;
use App\Models\Paiement;
 
class Formation extends Model
{
    use HasFactory;
 
    protected $fillable = [
        'specialite',
        'periode',
        'prix',
    ];


    public function matieres(){
        return $this->belongsToMany(Matiere::class);
    }

    public function groupeFormation(){
        return $this->hasMany(GroupeFormation::class);
    }

    public function paiement(){
        return $this->hasMany(Paiement::class);
    }

    public function etudiants(){
        return $this->belongsToMany(Etudiant::class,'etudiant_formations');
    }
    
    public function scopeFilter($query, array $filters)
    {
        if ($filters['specialite'] ?? false) {
            $query->where('specialite', 'like', '%' . $filters['specialite'] . '%');
        }

        if ($filters['search'] ?? false) {
            $query->where('periode', 'like', '%' . $filters['search'] . '%')
            ->orWhere('specialite', 'like', '%' . $filters['search'] . '%')
            ->orWhere('prix', 'like', '%' . $filters['search'] . '%');
        }
    }

}