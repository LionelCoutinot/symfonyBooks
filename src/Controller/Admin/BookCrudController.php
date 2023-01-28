<?php

namespace App\Controller\Admin;

use App\Entity\Book;

use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Form\Type\FileUploadType;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class BookCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Book::class;
    }

    
    public function configureFields(string $pageName): iterable // configuration des champs de l'entité " Book "
    {
        return [
            TextField::new('title'),
            AssociationField::new('authors') ->autocomplete()
            ->autocomplete()
            ->setFormTypeOption('by_reference', false), /* " authors " au pluriel car liaison ManyToMany*/
            AssociationField::new('category'),
            TextEditorField::new('description'),
            ImageField::new('picture')
            ->setBasePath('uploads/')
            ->setUploadDir('public/uploads/')
            ->setFormType(FileUploadType::class)
            ->setUploadedFileNamePattern('[randomhash].[extension]')
            ->setRequired(false),
            TextField::new('language'),
            TextField::new('collection'),
            TextField::new('editor'),
            TextField::new('releasedate'),
            NumberField::new('numberpages'),
            NumberField::new('price'),
            NumberField::new('promo'),
            TextField::new('isbn10'),
            TextField::new('isbn13'),
            NumberField::new('stock'),
        ];
    }
    
}
