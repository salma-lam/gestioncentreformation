<?php
 
namespace App\Models;
 
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\EmploiTemps;
use App\Models\Matiere;
use App\Models\GroupeFormation;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Auth\Authenticatable as AuthenticatableTrait;


class Professeur extends Model implements Authenticatable  
{
    use AuthenticatableTrait;
    use HasFactory;

    protected $table = 'professeurs';
 
    protected $fillable = [
        'prenom',
        'nom',
        'email',
        'password',
        'tel'
    ];

    public function emploiTeemps(){
        return $this->hasMany(EmploiTemps::class);
    }

    public function matieres(){
        return $this->belongsToMany(Matiere::class);
    }

    public function GroupeFormations(){
        return $this->belongsToMany(Matiere::class);
    }

    public function emploi(){
        return $this->hasMany(Emploi::class);
    }

    public function scopeFilter($query, array $filters)
    {
        if ($filters['nom'] ?? false) {
            $query->where('nom', 'like', '%' . $filters['nom'] . '%');
        }

        if ($filters['search'] ?? false) {
            $query->where('prenom', 'like', '%' . $filters['search'] . '%')
                ->orWhere('nom', 'like', '%' . $filters['search'] . '%')
                ->orWhere('email', 'like', '%' . $filters['search'] . '%');
        }
    }
}