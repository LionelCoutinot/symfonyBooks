<?php

namespace App\Controller\Admin;

use App\Entity\Author;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class AuthorCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Author::class;
    }

    
    public function configureFields(string $pageName): iterable // Configuration des champs de l'entité " Author "
    {
        return [
            
            TextField::new('firstname'),
            TextField::new('lastname'),
        ];
    }
    
}

