<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

#[Fillable(['name', 'email', 'password'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable;
     
     protected $table = 'users';
     protected $primaryKey = 'id_user';
     public $timestamps = false;
     protected $fillable = ['nama', 'email', 'nim', 'password', 'role', 'no_hp'];

     protected $hidden = ['password'];
    
     protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }
}
