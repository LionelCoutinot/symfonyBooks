<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Author;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BookController extends AbstractController
{
     /**
    * @Route("/book/{id}", name="book")
    */
    public function single(ManagerRegistry $doctrine, $id): Response /* Les détails de chaque livre  */
    {
        $book=$doctrine->getRepository(Book::class)->find($id);   /* récupération de chaque livre dans la BDD */
        $category=$book->getCategory(); /* Récupération de la " catégorie " affiliée à chaque livre  */
        $authors=$doctrine->getRepository(Author::class)->find($id); /* Récupération de " l'auteur " ou des " auteurs"  de chaque livre  */
             
        return $this->render('book/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'BookController',
            'book'=>$book,            
            'authors'=>$authors,
            'category' =>$category,
        ]);
    }
}

